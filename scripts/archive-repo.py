#!/usr/bin/env python3

import argparse
import os
import re
import subprocess
import sys

ROOT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
REPOSITORIES_TF = os.path.join(ROOT_DIR, "repositories.tf")
ARCHIVED_TF = os.path.join(ROOT_DIR, "archived-repositories", "repositories.tf")
ARCHIVED_DIR = os.path.join(ROOT_DIR, "archived-repositories")


def parse_args():
    parser = argparse.ArgumentParser(
        description="Archive GitHub repositories managed by OpenTofu"
    )
    parser.add_argument(
        "repo_names",
        nargs="+",
        help='Repository names as they appear on GitHub (e.g. "adjutant-moc")',
    )
    parser.add_argument(
        "--yes",
        action="store_true",
        help="Skip confirmation prompts before tofu apply",
    )
    return parser.parse_args()


def confirm(prompt, auto_yes):
    if auto_yes:
        return True
    response = input(f"{prompt} [y/N] ").strip().lower()
    return response in ("y", "yes")


def run_tofu(args, cwd=ROOT_DIR):
    cmd = ["tofu"] + args
    print(f"+ {' '.join(cmd)}")
    result = subprocess.run(cmd, cwd=cwd)
    if result.returncode != 0:
        print(f"Error: tofu command failed with exit code {result.returncode}")
        sys.exit(1)


def run_tofu_apply(cwd=ROOT_DIR, auto_yes=False):
    run_tofu(["plan", "-out=plan.out", "-input=false"], cwd=cwd)
    if not confirm("Apply this plan?", auto_yes):
        print("Aborted.")
        sys.exit(1)
    run_tofu(["apply", "plan.out"], cwd=cwd)
    plan_file = os.path.join(cwd, "plan.out")
    if os.path.exists(plan_file):
        os.remove(plan_file)


def find_module_block(content, repo_name):
    """Find the module block for the given repo and return (start, end) line indices."""
    module_name = make_module_name(repo_name)
    lines = content.splitlines(keepends=True)
    start = None
    depth = 0

    for i, line in enumerate(lines):
        if start is None:
            if re.match(rf'^module\s+"{re.escape(module_name)}"\s*\{{', line):
                start = i
                depth = 1
        else:
            depth += line.count("{") - line.count("}")
            if depth == 0:
                return start, i
    if start is not None:
        raise ValueError(f"Unterminated module block for {module_name}")
    return None, None


def make_module_name(repo_name):
    return "repo-" + repo_name.lower()


def make_tf_identifier(repo_name):
    """Convert repo name to a valid TF resource identifier."""
    return "repo-" + repo_name.lower().replace(".", "-").replace(" ", "-")


def parse_module_attrs(block_lines):
    """Extract simple key=value attributes from a module block.

    Returns a dict of attribute name to raw value string.
    Skips nested blocks (teams, users, labels, template) and source.
    """
    attrs = {}
    depth = 0
    skip_block = False

    for line in block_lines:
        depth += line.count("{") - line.count("}")

        if depth > 1:
            skip_block = True
            continue
        if skip_block and depth <= 1:
            skip_block = False
            continue

        m = re.match(r"^\s+(\w+)\s*=\s*(.+?)\s*$", line)
        if m:
            key, val = m.group(1), m.group(2)
            if key in ("source",):
                continue
            attrs[key] = val

    return attrs


def remove_collaborators_from_block(block_lines):
    """Remove teams, users, labels blocks and include_default_labels from a module block."""
    result = []
    depth = 0
    in_nested = False
    nested_keys = {"teams", "users", "labels"}

    for line in block_lines:
        open_count = line.count("{")
        close_count = line.count("}")

        if not in_nested:
            stripped = line.strip()
            if any(re.match(rf"^{key}\s*=\s*\{{", stripped) for key in nested_keys):
                in_nested = True
                depth = open_count - close_count
                if depth == 0:
                    in_nested = False
                continue
            if re.match(r"^include_default_labels\s*=", stripped):
                continue
            result.append(line)
        else:
            depth += open_count - close_count
            if depth <= 0:
                in_nested = False

    return result


def remove_trailing_blank_lines_in_block(block_lines):
    """Remove consecutive blank lines and trailing blank lines before closing brace."""
    result = []
    for i, line in enumerate(block_lines):
        if (
            line.strip() == ""
            and i + 1 < len(block_lines)
            and block_lines[i + 1].strip() in ("}", "")
        ):
            continue
        if line.strip() == "" and result and result[-1].strip() == "":
            continue
        result.append(line)
    return result


def remove_module_from_content(content, repo_name):
    """Remove a module block from file content, cleaning up surrounding blank lines."""
    lines = content.splitlines(keepends=True)
    start, end = find_module_block(content, repo_name)
    if start is None:
        return content

    new_lines = lines[:start] + lines[end + 1 :]
    while start < len(new_lines) and start > 0:
        if (
            new_lines[start - 1].strip() == ""
            and start < len(new_lines)
            and new_lines[start].strip() == ""
        ):
            new_lines.pop(start)
        else:
            break

    return "".join(new_lines)


def generate_archived_block(repo_name, attrs):
    """Generate an HCL resource block for archived-repositories/repositories.tf."""
    tf_id = make_tf_identifier(repo_name)
    lines = [f'resource "github_repository" "{tf_id}" {{']

    lines.append(f"  name         = {attrs['name']}")
    if "description" in attrs:
        lines.append(f"  description  = {attrs['description']}")
    if "visibility" in attrs and attrs["visibility"].strip('"') == "private":
        lines.append('  visibility   = "private"')
    if "has_issues" in attrs and attrs["has_issues"] == "false":
        lines.append("  has_issues   = false")
    if "has_wiki" in attrs and attrs["has_wiki"] == "true":
        lines.append("  has_wiki     = true")
    else:
        lines.append("  has_wiki     = false")
    if "homepage_url" in attrs:
        lines.append(f"  homepage_url = {attrs['homepage_url']}")
    lines.append("  archived     = true")
    lines.append("  has_projects = false")
    lines.append("}")

    return "\n".join(lines) + "\n"


def step_header(step_num, description):
    print()
    print(f"{'=' * 60}")
    print(f"Step {step_num}: {description}")
    print(f"{'=' * 60}")
    print()


def main():
    args = parse_args()
    repo_names = args.repo_names

    # Step 1: Validate all repos
    step_header(1, "Validate")
    content = open(REPOSITORIES_TF).read()
    repo_attrs = {}
    skipped = []
    for repo_name in repo_names:
        module_name = make_module_name(repo_name)
        start, end = find_module_block(content, repo_name)
        if start is None:
            print(f'  Warning: module "{module_name}" not found in {REPOSITORIES_TF}, skipping')
            skipped.append(repo_name)
            continue
        lines = content.splitlines(keepends=True)
        block_lines = lines[start : end + 1]
        attrs = parse_module_attrs(block_lines)
        repo_attrs[repo_name] = attrs
        github_name = attrs["name"].strip('"')
        print(f'  Found module "{module_name}" (repo: {github_name})')
    for repo_name in skipped:
        repo_names.remove(repo_name)
    if not repo_names:
        print("\nNo repositories to archive.")
        sys.exit(0)
    print(f"\n{len(repo_names)} repositories to archive.")

    # Step 2: Remove collaborators from all repos
    step_header(2, "Remove collaborators")
    content = open(REPOSITORIES_TF).read()
    modified = False
    for repo_name in repo_names:
        lines = content.splitlines(keepends=True)
        start, end = find_module_block(content, repo_name)
        block_lines = lines[start : end + 1]

        attrs = repo_attrs[repo_name]
        is_private = attrs.get("visibility", "").strip('"') == "private"

        if is_private:
            print(f"  {repo_name}: private repo, leaving collaborators untouched")
            continue

        has_collaborators = any(
            re.match(r"^\s+(teams|users|labels|include_default_labels)\s*=", line)
            for line in block_lines
        )

        if has_collaborators:
            new_block = remove_collaborators_from_block(block_lines)
            new_block = remove_trailing_blank_lines_in_block(new_block)
            new_lines = lines[:start] + new_block + lines[end + 1 :]
            content = "".join(new_lines)
            modified = True
            print(f"  {repo_name}: removed collaborators")
        else:
            print(f"  {repo_name}: no collaborators, skipping")

    if modified:
        with open(REPOSITORIES_TF, "w") as f:
            f.write(content)
        run_tofu_apply(cwd=ROOT_DIR, auto_yes=args.yes)
    else:
        print("No changes needed.")

    # Step 3: Remove all modules from repositories.tf
    step_header(3, "Remove modules from repositories.tf")
    content = open(REPOSITORIES_TF).read()
    for repo_name in repo_names:
        module_name = make_module_name(repo_name)
        content = remove_module_from_content(content, repo_name)
        print(f'  Removed module "{module_name}"')

    with open(REPOSITORIES_TF, "w") as f:
        f.write(content)

    # Step 4: Remove from tofu state
    step_header(4, "Remove from tofu state")
    for repo_name in repo_names:
        module_name = make_module_name(repo_name)
        run_tofu(["state", "rm", f"module.{module_name}"], cwd=ROOT_DIR)

    # Step 5: Generate archived resource blocks
    step_header(5, "Generate archived resource blocks")
    with open(ARCHIVED_TF, "r") as f:
        archived_content = f.read()
    if not archived_content.endswith("\n"):
        archived_content += "\n"

    for repo_name in repo_names:
        attrs = repo_attrs[repo_name]
        archived_block = generate_archived_block(repo_name, attrs)
        archived_content += "\n" + archived_block
        print(f"  {repo_name}: generated archived block")

    with open(ARCHIVED_TF, "w") as f:
        f.write(archived_content)

    # Step 6: Import all into archived-repositories
    step_header(6, "Import into archived-repositories state")
    for repo_name in repo_names:
        attrs = repo_attrs[repo_name]
        github_name = attrs["name"].strip('"')
        tf_id = make_tf_identifier(repo_name)
        run_tofu(
            ["import", f"github_repository.{tf_id}", github_name],
            cwd=ARCHIVED_DIR,
        )

    # Step 7: Apply in archived-repositories (archives repos and syncs state)
    step_header(7, "Apply in archived-repositories")
    run_tofu_apply(cwd=ARCHIVED_DIR, auto_yes=args.yes)

    print()
    names = ", ".join(repo_attrs[r]["name"].strip('"') for r in repo_names)
    print(f"Done! Archived {len(repo_names)} repositories: {names}")


if __name__ == "__main__":
    main()
