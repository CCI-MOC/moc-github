package main

all_resources contains resource if {
	some resource in input.planned_values.root_module.resources
}

all_resources contains resource if {
	some module in input.planned_values.root_module.child_modules
	some resource in module.resources
}

deny contains msg if {
	some resource in all_resources
	resource.type == "github_team"
	not resource.values.description
	msg := sprintf("github_team %q must have a non-empty description", [resource.address])
}

deny contains msg if {
	some resource in all_resources
	resource.type == "github_team"
	resource.values.description == ""
	msg := sprintf("github_team %q must have a non-empty description", [resource.address])
}
