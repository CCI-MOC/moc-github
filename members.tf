locals {
  members = csvdecode(file("${path.module}/members.csv"))
}

resource "github_membership" "this" {
  for_each = { for m in local.members : m.username => m.role }
  username = each.key
  role     = each.value
}
