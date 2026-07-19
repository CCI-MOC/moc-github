locals {
  teams      = csvdecode(file("${path.module}/teams.csv"))
  team_slugs = toset([for f in fileset("${path.module}/team-members", "*.csv") : trimsuffix(f, ".csv")])
  all_members = [
    for m in local.members : {
      username = lower(m.username)
      role     = m.role == "admin" ? "maintainer" : "member"
    }
  ]
  team_members = merge(
    {
      for slug in local.team_slugs : slug => [
        for m in csvdecode(file("${path.module}/team-members/${slug}.csv")) : {
          username = lower(m.username)
          role     = m.role
        }
      ]
    },
    {
      all-members = local.all_members
    },
  )
}

resource "github_team" "this" {
  for_each       = { for t in local.teams : replace(lower(t.name), "/[^a-z0-9_]+/", "-") => t }
  name           = each.value.name
  description    = each.value.description
  privacy        = each.value.privacy
  parent_team_id = each.value.parent != "" ? each.value.parent : null
}

resource "github_team_members" "this" {
  for_each  = local.team_members
  team_slug = each.key

  dynamic "members" {
    for_each = each.value
    content {
      username = members.value.username
      role     = members.value.role
    }
  }
}
