#!/bin/bash

: "${GITHUB_ORG:=CCI-MOC}"

log() {
  printf "[%s] %s\n" "$@"
}

log info "loading state"
state=$(tofu show -json)
archived_state=$(tofu -chdir=archived-repositories show -json)

if [[ -z "$state" ]]; then
  echo "ERROR: unable to read tofu state" >&2
  exit 1
fi

log info "finding managed repositories"
managed_repositories=$(
  (
    jq '.values.root_module | .. | select(.type? == "github_repository") | .values.name' -r <<<"$state"
    jq '.values.root_module | .. | select(.type? == "github_repository") | .values.name' -r <<<"$archived_state"
  ) | sort
)

log info "finding managed members"
managed_members=$(
  jq '.values.root_module | .. | select(.type? == "github_membership") | .values.username' -r <<<"$state" | sort
)

log info "finding managed teams"
managed_teams=$(
  jq '.values.root_module | .. | select(.type? == "github_team_members") | .index' -r <<<"$state" | sort
)

log info "finding github repositories"
github_repositories=$(
  gh api --paginate "/orgs/${GITHUB_ORG}/repos" | jq '.[]|.name' -r | sort
)

log info "finding github members"
github_members=$(
  gh api --paginate "/orgs/${GITHUB_ORG}/members" | jq '.[]|.login' -r | sort
)

log info "finding github teams"
github_teams=$(
  gh api --paginate "/orgs/${GITHUB_ORG}/teams" | jq '.[]|.slug' -r | sort
)

mapfile -t unmanaged_repositories < <(comm -13 <(echo "$managed_repositories") <(echo "$github_repositories"))
mapfile -t unmanaged_members < <(comm -13 <(echo "$managed_members") <(echo "$github_members"))
mapfile -t unmanaged_teams < <(comm -13 <(echo "$managed_teams") <(echo "$github_teams"))

exitcode=0

log info "checking for drift"
if [[ ${#unmanaged_repositories[@]} -ne 0 ]]; then
  log error "found unmanaged repositories:"
  for repo in "${unmanaged_repositories[@]}"; do
    log error "  $repo"
  done
  exitcode=1
fi

if [[ ${#unmanaged_members[@]} -ne 0 ]]; then
  log error "Found unmanaged members:"
  for member in "${unmanaged_members[@]}"; do
    log error "  $member"
  done
  exitcode=1
fi

if [[ ${#unmanaged_teams[@]} -ne 0 ]]; then
  log error "Found unmanaged teams:"
  for team in "${unmanaged_teams[@]}"; do
    log error "  $team"
  done
  exitcode=1
fi

if ! ((exitcode)); then
  log success "no drift detected"
fi

exit $exitcode
