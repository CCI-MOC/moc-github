variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "visibility" {
  type    = string
  default = "public"
}

variable "has_issues" {
  type    = bool
  default = true
}

variable "has_projects" {
  type    = bool
  default = false
}

variable "has_wiki" {
  type    = bool
  default = false
}

variable "has_discussions" {
  type    = bool
  default = false
}

variable "archived" {
  type    = bool
  default = false
}

variable "homepage_url" {
  type    = string
  default = null
}

variable "is_template" {
  type    = bool
  default = false
}

variable "allow_auto_merge" {
  type    = bool
  default = true
}

variable "delete_branch_on_merge" {
  type    = bool
  default = false
}

variable "allow_update_branch" {
  type    = bool
  default = true
}

variable "template" {
  type = object({
    owner      = string
    repository = string
  })
  default = null
}

variable "teams" {
  description = "Map of team slug to permission level (e.g. {\"my-team\" = \"push\"})"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for permission in values(var.teams) : contains(["pull", "triage", "push", "maintain", "admin"], permission)
    ])
    error_message = "Team permission must be one of: pull, triage, push, maintain, admin."
  }
}

variable "users" {
  description = "Map of GitHub username to permission level (e.g. {\"username\" = \"push\"})"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for permission in values(var.users) : contains(["pull", "triage", "push", "maintain", "admin"], permission)
    ])
    error_message = "User permission must be one of: pull, triage, push, maintain, admin."
  }
}

variable "labels" {
  description = "Map of label name to label attributes (e.g. {\"my-label\" = {color = \"d73a4a\", description = \"My label\"}})"
  type = map(object({
    color       = string
    description = optional(string, "")
  }))
  default = {}
}

variable "include_default_labels" {
  description = "Whether to include the default GitHub labels (bug, documentation, duplicate, enhancement, good first issue, help wanted, invalid, question, wontfix)"
  type        = bool
  default     = true
}

variable "branch_protection" {
  description = "Branch protection rules applied to the default branch"
  type = object({
    required_reviews       = optional(number, 1)
    required_status_checks = optional(list(string), [])
    require_linear_history = optional(bool, false)
  })
  default = null
}

variable "pages" {
  description = "Configuration for github pages"
  type = object({
    source = optional(object({
      branch = string
      path   = string
    }))
    build_type     = optional(string, "legacy")
    cname          = optional(string)
    https_enforced = optional(bool, "true")
  })
  default = null

  validation {
    error_message = "build_type must be one of \"workflow\" or \"legacy\""
    condition = var.pages == null ? true : (
      var.pages.build_type == null ||
      contains(["legacy", "workflow"], var.pages.build_type)
    )
  }

  validation {
    error_message = "source block cannot be provided when build_type is \"workflow\""
    condition = var.pages == null ? true : (
      var.pages.build_type == "workflow" ? var.pages.source == null : true
    )
  }
}
