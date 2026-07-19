# Manage MOC GitHub repositories with OpenTofu

This repository contains the [OpenTofu] configuration for managing the CCI-MOC GitHub organization.

[opentofu]: https://opentofu.org/

## Repository structure

```
.
├── archived-repositories
├── modules
│   └── common_repository
├── policy
├── scripts
└── team-members

7 directories
```

- The top level directory is the root of the active OpenTofu configuration.
- The `archived-repositories` directory contains a separate OpenTofu configuration that manages older, archived CCI-MOC repositories. If any repository in this directory needs to be un-archived, part of that process should be bringing the repository configuration into the top level directory.
- The `modules` directory contains OpenTofu [modules] referenced by our configuration.
- The `team-members` directory contains team membership information, one CSV file for each team.
- The `policy` directory contains [Open Policy Agent] policy definitions that are used to validate the complete configuration. `scripts/check-policy.sh` renders the OpenTofu plan as JSON and feeds this to `conftest`.

[modules]: https://opentofu.org/docs/language/modules/
[open policy agent]: https://www.openpolicyagent.org/

## Modules

This repository includes the following OpenTofu modules:

### common_repository

The `common_repository` module is used to manage all repositories. It provides a consistent mechanism for creating the repository, applying a common set of labels, setting up user and team collaborators, creating branch protection rules, and managing other per-repository configuration.

## Create a repository

Repository configurations live in [`repositories.tf'](repositories.tf). The simplest repository configuration will look like this:

```hcl
module "repo-virtualbmc" {
  source      = "./modules/common_repository"
  name        = "virtualbmc"
  description = "Virtual BMC for Ironic nodes using the IPMI protocol"
}
```

This creates a repository with the default set of labels and no explicit collaborators. A repository with team collaborators and typical branch protection rules will look like this:

```hcl
module "repo-moc-keycloak" {
  source      = "./modules/common_repository"
  name        = "moc-keycloak"
  description = "Keycloak configuration for sso.massopen.cloud"

  teams = {
    "keycloak-workers" = "maintain"
    "open-accelerator" = "push"
  }

  branch_protection = {
    required_reviews = 2
    required_status_checks = [
      "pre-commit",
      "bootstrap"
    ]
    require_linear_history = true
  }
}
```

## Create a team

To create team, add a new entry to [`teams.csv`](teams.csv). Each line consists of four fields:

```csv
name,description,privacy,parent
```

- `name` is the team name. Life is easier if this is all lower case and contains no whitespace.
- `description` is arbitrary text describing the team.
- `privacy` sets the [team visibility]. This can be `closed` or `secret`. A `closed` team can be seen and mentioned by any member of the organization, while a `secret` team is only visible to team members and organization owners.
- `parent` is used to set a parent team

[team visbility]: https://docs.github.com/en/organizations/organizing-members-into-teams/changing-team-visibility

Team membership is managed in `team-members/<team_name>.csv`. Each file in this directory has two fields:

```csv
username,role
```

Where `username` is the member name, and `role` is either `member` or `maintainer`. Note that an organization owner must always have `maintainer` membership in teams (otherwise there will be noise every time we run `tofu plan` because GitHub will report membership as `maintainer` and `tofu` will attempt to change it to `member`).
