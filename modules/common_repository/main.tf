terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

locals {
  default_labels = {
    "bug"              = { color = "d73a4a", description = "Something isn't working" }
    "documentation"    = { color = "0075ca", description = "Improvements or additions to documentation" }
    "duplicate"        = { color = "cfd3d7", description = "This issue or pull request already exists" }
    "enhancement"      = { color = "a2eeef", description = "New feature or request" }
    "good first issue" = { color = "7057ff", description = "Good for newcomers" }
    "help wanted"      = { color = "008672", description = "Extra attention is needed" }
    "invalid"          = { color = "e4e669", description = "This doesn't seem right" }
    "question"         = { color = "d876e3", description = "Further information is requested" }
    "wontfix"          = { color = "ffffff", description = "This will not be worked on" }
  }

  all_labels = merge(
    var.include_default_labels ? local.default_labels : {},
    var.labels
  )
}

resource "github_repository" "this" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  has_discussions        = var.has_discussions
  archived               = var.archived
  homepage_url           = var.homepage_url
  is_template            = var.is_template
  allow_auto_merge       = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  allow_update_branch    = var.allow_update_branch

  dynamic "template" {
    for_each = var.template != null ? [var.template] : []
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }
}

resource "github_repository_pages" "this" {
  count      = var.archived || var.pages == null ? 0 : 1
  repository = github_repository.this.name

  cname          = var.pages.cname
  build_type     = var.pages.build_type
  https_enforced = var.pages.https_enforced

  dynamic "source" {
    for_each = var.pages.source != null ? [var.pages.source] : []

    content {
      branch = source.value.branch
      path   = source.value.path
    }
  }
}

resource "github_repository_collaborators" "this" {
  repository = github_repository.this.name

  dynamic "team" {
    for_each = var.teams
    content {
      team_id    = team.key
      permission = team.value
    }
  }

  dynamic "user" {
    for_each = var.users
    content {
      username   = user.key
      permission = user.value
    }
  }
}

resource "github_issue_labels" "this" {
  # When attempting to remove labels and archive a repository in a single
  # operation, the repository is marked as archived before tofu attempts to
  # delete the labels. This leads to an error because the archive is now
  # read-only.
  #
  # The following construct effectively "hides" the label resource when
  # archiving a repository (so the repository gets archived and we make no
  # changes to the labels).
  count      = var.archived ? 0 : 1
  repository = github_repository.this.name

  dynamic "label" {
    for_each = local.all_labels
    content {
      name        = label.key
      color       = label.value.color
      description = label.value.description
    }
  }
}

resource "terraform_data" "remove_legacy_branch_protection" {
  count = var.branch_protection != null && var.visibility == "public" && !var.archived ? 1 : 0

  triggers_replace = github_repository.this.name

  provisioner "local-exec" {
    command = <<-EOT
      repo="${github_repository.this.full_name}"
      branch="$(gh api "/repos/$repo" --jq .default_branch 2>/dev/null)" || exit 0
      gh api -X DELETE "/repos/$repo/branches/$branch/protection" \
        --silent 2>/dev/null || true
    EOT
  }
}

resource "github_repository_ruleset" "this" {
  count = var.branch_protection != null && var.visibility == "public" && !var.archived ? 1 : 0

  name        = "default-branch-protection"
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = "active"

  bypass_actors {
    actor_type  = "OrganizationAdmin"
    bypass_mode = "always"
  }

  # actor_id 5 is the built-in "Admin" repository role
  bypass_actors {
    actor_id    = 5
    actor_type  = "RepositoryRole"
    bypass_mode = "always"
  }

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  rules {
    required_linear_history = var.branch_protection.require_linear_history

    pull_request {
      required_approving_review_count = var.branch_protection.required_reviews
    }

    dynamic "required_status_checks" {
      for_each = length(var.branch_protection.required_status_checks) > 0 ? [1] : []
      content {
        dynamic "required_check" {
          for_each = toset(var.branch_protection.required_status_checks)
          content {
            context = required_check.value
          }
        }
      }
    }
  }
}

moved {
  from = github_issue_labels.this
  to   = github_issue_labels.this[0]
}

removed {
  from = github_team_repository.this
  lifecycle {
    destroy = false
  }
}

removed {
  from = github_repository_collaborator.this
  lifecycle {
    destroy = false
  }
}
