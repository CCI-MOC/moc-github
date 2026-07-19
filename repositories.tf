
module "repo-access-requests" {
  source      = "./modules/common_repository"
  name        = "access-requests"
  description = "Tracks issues for access requests to the environment that cannot be completed with other tools"
  visibility  = "private"

  teams = {
    "ai-ivp"                   = "maintain"
    "ai-ivp-bastion-reviewers" = "triage"
  }

  labels = {
    "approved" = { color = "008672", description = "Request has been approved" }
    "denied"   = { color = "d73a4a", description = "Request has been denied" }
  }

  include_default_labels = false
}

module "repo-ai-accelerator" {
  source      = "./modules/common_repository"
  name        = "ai-accelerator"
  description = "The AI Accelerator is a template project for setting up Red Hat OpenShift AI using GitOps"
  has_issues  = false

  teams = {
    "ai-ivp" = "maintain"
  }
}

module "repo-ai-ivp" {
  source      = "./modules/common_repository"
  name        = "ai-ivp"
  description = "AI-Infrastructure Validated Pattern"

  teams = {
    "ai-ivp"          = "maintain"
    "external-triage" = "triage"
    "redhat"          = "maintain"
  }

  labels = {
    "MOC 2.0" = { color = "aaaaaa", description = "" }
  }
}

module "repo-ansible-switches" {
  source      = "./modules/common_repository"
  name        = "ansible-switches"
  description = "Ansible site for MOC/OCT switches"

  teams = {
    "redhat" = "maintain"
  }

  labels = {
    "AAA Test" = { color = "e99695", description = "" }
  }
}

module "repo-ansible-switches-auto-deploy" {
  source      = "./modules/common_repository"
  name        = "ansible-switches-auto-deploy"
  description = "Automated deployment of MOC/OCT switches on commit to ansible-switches repo"
}

module "repo-bare-metal-usage-scripts" {
  source      = "./modules/common_repository"
  name        = "bare-metal-usage-scripts"
  description = "Scripts for tracking bare metal resource usage"

  labels = {
    "MOC 1.0" = { color = "9f70a7", description = "" }
    "MOC 2.0" = { color = "aaaaaa", description = "" }
  }
}

module "repo-dbex" {
  source      = "./modules/common_repository"
  name        = "dbex"
  description = "a DataBase EXample that reproduces dropping connections when connected using python. "
}

module "repo-debugconnectiontimeout" {
  source      = "./modules/common_repository"
  name        = "debugConnectionTimeout"
  description = "This is a test repo to debug the connection timeout issue discovered when connecting to mariadb"
}

module "repo-distro-packages" {
  source      = "./modules/common_repository"
  name        = "distro-packages"
  description = "Scripts for making distro packages for software used by the MOC"
}

module "repo-documentation" {
  source      = "./modules/common_repository"
  name        = "documentation"
  description = "This is where we host all MOC documentation"

  teams = {
    "ops-core" = "admin"
  }

  labels = {
    "accepted"          = { color = "ededed", description = "" }
    "needs_description" = { color = "ededed", description = "" }
  }
}

module "repo-everpure-moc" {
  source      = "./modules/common_repository"
  name        = "everpure-moc"
  description = "Repo housing instructions and manifests for deploying and managing Pure storage resources in the MOC"

  users = {
    "DanNiESh" = "push"
  }
}

module "repo-fx2-ansible" {
  source      = "./modules/common_repository"
  name        = "fx2-ansible"
  description = "Ansible playbooks for deploying FX2 machines"
}

module "repo-gpfs-storage" {
  source      = "./modules/common_repository"
  name        = "gpfs-storage"
  description = "Collection of notes and scripts for IBM Scale"
}

module "repo-invoicing" {
  source      = "./modules/common_repository"
  name        = "invoicing"
  description = "Invoicing system for the NERC"

  teams = {
    "moc-openshift-people"     = "triage"
    "open-source-contributors" = "triage"
    "ops-core"                 = "maintain"
  }

  labels = {
    "MOC 1.0"  = { color = "9f70a7", description = "" }
    "MOC 2.0"  = { color = "aaaaaa", description = "" }
    "MOC 2.0?" = { color = "5f2521", description = "" }
  }
}

module "repo-invoicing-private-data" {
  source      = "./modules/common_repository"
  name        = "invoicing-private-data"
  description = "Private billing exclusion data for NERC invoicing"
  visibility  = "private"

  teams = {
    "mghpcc"                   = "push"
    "nercdev"                  = "push"
    "nercpis"                  = "pull"
    "open-source-contributors" = "pull"
    "ops-core"                 = "maintain"
  }

  labels = {
    "MOC 1.0" = { color = "9f70a7", description = "" }
  }
}

module "repo-iucrc-stuff" {
  source      = "./modules/common_repository"
  name        = "iucrc-stuff"
  description = "IUCRC project materials and documentation"
  visibility  = "private"
}

module "repo-lsvd-atc24" {
  source      = "./modules/common_repository"
  name        = "lsvd-atc24"
  description = "LSVD paper submission for USENIX ATC 2024"
  visibility  = "private"
}

module "repo-lsvd-rbd" {
  source      = "./modules/common_repository"
  name        = "lsvd-rbd"
  description = "Log Structured Virtual Disk"
  has_wiki    = true

  teams = {
    "ops-core"         = "push"
    "storage-research" = "maintain"
  }
  users = {
    "kyokeunpark" = "maintain"
  }
}

module "repo-lsvd-research" {
  source      = "./modules/common_repository"
  name        = "lsvd-research"
  description = "Research papers and experimental scripts for LSVD"
  visibility  = "private"
  has_wiki    = true

  teams = {
    "storage-research" = "maintain"
  }
}

module "repo-mghpcc-cablelength-calculator" {
  source      = "./modules/common_repository"
  name        = "mghpcc-cablelength-calculator"
  description = "JS app to calculate cable length between racks"
}

module "repo-moc-aws" {
  source      = "./modules/common_repository"
  name        = "moc-aws"
  description = "OpenTofu management of AWS resources for the Mass Open Cloud"

  branch_protection = {
    required_reviews = 1
    required_status_checks = [
      "pre-commit",
      "plan"
    ]
    require_linear_history = true
  }

  teams = {
    ops-core   = "admin"
    ops-collab = "triage"
  }
}

module "repo-moc-dns" {
  source      = "./modules/common_repository"
  name        = "moc-dns"
  description = "DNS configuration for the Mass Open Cloud"

  teams = {
    "ops-core" = "admin"
  }
}

module "repo-moc-infra-config" {
  source      = "./modules/common_repository"
  name        = "moc-infra-config"
  description = "ArgoCD applications for the MOC-managed moc-infra OpenShift cluster"

  teams = {
    "moc-openshift-people"     = "push"
    "open-source-contributors" = "triage"
    "ops-core"                 = "push"
  }

  labels = {
    "MOC 1.0" = { color = "9f70a7", description = "" }
    "MOC 2.0" = { color = "ededed", description = "" }
  }
}

module "repo-moc-issues" {
  source      = "./modules/common_repository"
  name        = "MOC-issues"
  description = "MOC is moving away from non NIST HIPAA compliant platforms and therefore we need a fresh start to help keep track of work post non NIST HIPAA compliant platforms"
  template = {
    owner      = "CCI-MOC"
    repository = "moc-template"
  }

  teams = {
    "ai-ivp"                   = "maintain"
    "ai-ivp-bastion-reviewers" = "push"
    "marcomm"                  = "triage"
    "ops-collab"               = "triage"
    "ops-core"                 = "admin"
    "redhat"                   = "maintain"
  }

  labels = {
    "AAA Test"                               = { color = "e99695", description = "" }
    "accepted"                               = { color = "ededed", description = "" }
    "added_post_planning"                    = { color = "ccff4c", description = "" }
    "ai-telemetry"                           = { color = "2E4C86", description = "" }
    "Billing"                                = { color = "5bbaac", description = "" }
    "blocked"                                = { color = "873719", description = "Include reason issue is blocked in the description" }
    "coldfront"                              = { color = "A73DC0", description = "This issue pertains to NERC ColdFront" }
    "CrossRepoTest"                          = { color = "a0201d", description = "" }
    "development"                            = { color = "49FD99", description = "" }
    "Engagement"                             = { color = "5f348e", description = "" }
    "epic"                                   = { color = "BBDA16", description = "" }
    "ESI"                                    = { color = "5b0d01", description = "" }
    "flax"                                   = { color = "F0D3F7", description = "issues we are working on with Flax" }
    "GDPR"                                   = { color = "9f4f21", description = "" }
    "General Availability of ESI"            = { color = "7f8a57", description = "" }
    "generateMoreTasks"                      = { color = "FBCA04", description = "This label indicates the assign should breakdown the complex task assigned to many subtasks." }
    "gitopsify"                              = { color = "e99695", description = "" }
    "gpu"                                    = { color = "006b75", description = "" }
    "H100 Optimization"                      = { color = "aaaaaa", description = "" }
    "Harvard Disengagement"                  = { color = "786ff4", description = "Harvard is disengaging from NERC." }
    "invoice processing"                     = { color = "aaaaaa", description = "" }
    "loki-logs"                              = { color = "3A5F3D", description = "" }
    "mghpcc"                                 = { color = "5319e7", description = "MGHPCC related tasks" }
    "MOC 1.0"                                = { color = "9f70a7", description = "" }
    "MOC 2.0"                                = { color = "ededed", description = "" }
    "MOC 2.0?"                               = { color = "5f2521", description = "" }
    "moc esi"                                = { color = "A745A5", description = "" }
    "monitoring"                             = { color = "4eed68", description = "" }
    "Multiple Production OpenShift Clusters" = { color = "780941", description = "" }
    "NAIRR"                                  = { color = "2301bc", description = "NAIRR — Tracks work associated with NAIRR research projects (NSF)" }
    "needs_clarification"                    = { color = "F5CA41", description = "This issue needs to be clarified" }
    "needs_description"                      = { color = "ededed", description = "" }
    "needs_epic"                             = { color = "F6CB66", description = "Please create an epic for this issue to be added to, remove label once added" }
    "Networking & Security"                  = { color = "a62600", description = "" }
    "Non Roadmap Cost"                       = { color = "043a00", description = "" }
    "object-storage"                         = { color = "aaaaaa", description = "" }
    "observability"                          = { color = "997D3E", description = "" }
    "ocp_metrics_access_request"             = { color = "e99695", description = "Requesting access to NESE OpenShift Metrics and Logs" }
    "ope"                                    = { color = "407965", description = "This issue pertains to ope projects" }
    "openshift"                              = { color = "61C264", description = "This issue pertains to NERC OpenShift" }
    "openshift-virtualization"               = { color = "13EA94", description = "" }
    "openstack"                              = { color = "0052cc", description = "This issue pertains to NERC OpenStack" }
    "operator"                               = { color = "C9752E", description = "" }
    "Organized Training"                     = { color = "402712", description = "" }
    "Performance Enhancements"               = { color = "1757b9", description = "" }
    "postgres"                               = { color = "aaaaaa", description = "" }
    "Quickly integrating Lenovo GPUs"        = { color = "9c4242", description = "" }
    "Required for Sign-Off"                  = { color = "D5831E", description = "This issue is required for sign-off of the Epic is is part of" }
    "research"                               = { color = "e99695", description = "This task is primarily about information discovery" }
    "RH Onboarding"                          = { color = "650299", description = "" }
    "rhoai"                                  = { color = "d4c5f9", description = "RHOAI" }
    "RHRoadmap"                              = { color = "2617ef", description = "" }
    "security"                               = { color = "B60205", description = "Label for Security Issues" }
    "size/extra large"                       = { color = "5319e7", description = "Not been done before, new research, lot of time, risks to finishing in sprint, require extra help." }
    "size/extra small"                       = { color = "9BCC95", description = "Most requirements are understood, relatively easy, likely completed in a day or less." }
    "size/large"                             = { color = "16AE23", description = "Similar work done, complex, often requires assistance, commonly largest size done in sprint." }
    "size/medium"                            = { color = "103AD3", description = "Similar work has been done before, it is clear what needs to be done, a few steps beyond a small." }
    "size/milestone"                         = { color = "24653B", description = "needs to be broken down into multiple issues and a milestone created for it" }
    "size/small"                             = { color = "c5def5", description = "Small thought and effort required, similar work has been done, or extra small with small unknown." }
    "spike"                                  = { color = "C3DB0B", description = "evaluating the impact new technology has on the current implementation" }
    "standup"                                = { color = "7CCCF3", description = "Issues that need to be discussed in the standup meeting with other teammates." }
    "Storage"                                = { color = "5bdae8", description = "" }
    "support-ticket"                         = { color = "006b75", description = "" }
    "Technical Debt"                         = { color = "b6ff32", description = "" }
    "techsquare"                             = { color = "d93f0b", description = "" }
    "Upgrades"                               = { color = "f70db5", description = "" }
    "User Experience Enhancements"           = { color = "a8fa76", description = "" }
    "vendor-ticket"                          = { color = "1c946d", description = "To help keep track of issues that are associated with Vendor Tickets." }
    "vLLM"                                   = { color = "97ca36", description = "" }
    "VM"                                     = { color = "b70a00", description = "" }
    "website"                                = { color = "334A9E", description = "" }
    "open-accelerator"                       = { color = "0e8a16", description = "Open Accelerator environment" }
    "NIST 800-171"                           = { color = "aaaaaa" }
    "NIST 800-53"                            = { color = "76cf17", description = "NIST 800-53 compliance related" }
    "HIPAA"                                  = { color = "8951ec", description = "HIPAA compliance related" }
  }
}

module "repo-moc-status" {
  source      = "./modules/common_repository"
  name        = "moc-status"
  description = "MOC service status page"
  has_issues  = false

  teams = {
    "ops-core" = "push"
  }
}

module "repo-moc-template" {
  source      = "./modules/common_repository"
  name        = "moc-template"
  description = "Template repository for the CCI-MOC GitHub organization"
  is_template = true

  teams = {
    "ops-core" = "push"
  }
}

module "repo-moca-requests" {
  source       = "./modules/common_repository"
  name         = "moca-requests"
  description  = "Technical support requests for MOCA projects and services"
  homepage_url = "https://massopen.cloud/"

  teams = {
    "moca-request-workers" = "triage"
    "ops-core"             = "admin"
    "redhat"               = "maintain"
  }

  labels = {
    "AAA Test"   = { color = "e99695", description = "" }
    "Techsquare" = { color = "d93f0b", description = "" }
  }
}

module "repo-nerc-ocp-config" {
  source       = "./modules/common_repository"
  name         = "nerc-ocp-config"
  description  = "Configuration of NERC OpenShift clusters"
  has_issues   = false
  homepage_url = "https://nerc.mghpcc.org"
}

module "repo-nerc-rates" {
  source      = "./modules/common_repository"
  name        = "nerc-rates"
  description = "Rates and invoicing configuration for the NERC"
  template = {
    owner      = "CCI-MOC"
    repository = "moc-template"
  }

  teams = {
    "open-source-contributors" = "triage"
    "ops-core"                 = "maintain"
  }

  labels = {
    "MOC 1.0" = { color = "9f70a7", description = "" }
    "MOC 2.0" = { color = "aaaaaa", description = "" }
  }
}

module "repo-netbox-ansible" {
  source      = "./modules/common_repository"
  name        = "netbox-ansible"
  description = "Ansible site to keep netbox up-to-date"
}

module "repo-network-runner" {
  source      = "./modules/common_repository"
  name        = "network-runner"
  description = "Ansible Network Runner"
  has_issues  = false
}

module "repo-networking-ansible" {
  source      = "./modules/common_repository"
  name        = "networking-ansible"
  description = "OpenStack ML2 mechanism driver using Ansible Networking"

  teams = {
    "ops-core" = "maintain"
  }
}

module "repo-oct-powermon" {
  source      = "./modules/common_repository"
  name        = "oct-powermon"
  description = "Files for OCT power monitoring"
}

module "repo-openshift-acct-mgt" {
  source      = "./modules/common_repository"
  name        = "openshift-acct-mgt"
  description = "REST API for managing Users, Namespaces and ResourceQuotas on OpenShift"

  teams = {
    "ops-core" = "admin"
  }

  labels = {
    "AAA Test"          = { color = "e99695", description = "" }
    "accepted"          = { color = "ededed", description = "" }
    "MOC 1.0"           = { color = "9f70a7", description = "" }
    "MOC 2.0?"          = { color = "5f2521", description = "" }
    "needs_description" = { color = "ededed", description = "" }
    "size/extra large"  = { color = "5319e7", description = "Not been done before, new research, lot of time, risks to finishing in sprint, require extra help." }
    "size/extra small"  = { color = "9BCC95", description = "Most requirements are understood, relatively easy, likely completed in a day or less." }
    "size/large"        = { color = "16AE23", description = "Similar work done, complex, often requires assistance, commonly largest size done in sprint." }
    "size/medium"       = { color = "103AD3", description = "Similar work has been done before, it is clear what needs to be done, a few steps beyond a small." }
    "size/milestone"    = { color = "24653B", description = "needs to be broken down into multiple issues and a milestone created for it" }
    "size/small"        = { color = "c5def5", description = "Small thought and effort required, similar work has been done, or extra small with small unknown." }
  }
}

module "repo-openshift-usage-scripts" {
  source              = "./modules/common_repository"
  name                = "openshift-usage-scripts"
  description         = "Scripts for collecting and reporting OpenShift usage metrics"
  allow_update_branch = true

  teams = {
    "open-source-contributors" = "triage"
    "redhat"                   = "maintain"
  }

  labels = {
    "AAA Test"           = { color = "e99695", description = "" }
    "invoice processing" = { color = "aaaaaa", description = "" }
    "MOC 1.0"            = { color = "9f70a7", description = "" }
    "MOC 2.0"            = { color = "aaaaaa", description = "" }
    "MOC 2.0?"           = { color = "5f2521", description = "" }
  }
}

module "repo-openstack-billing-from-db" {
  source      = "./modules/common_repository"
  name        = "openstack-billing-from-db"
  description = "Simple billing from the database"

  teams = {
    "open-source-contributors" = "triage"
    "ops-core"                 = "triage"
  }

  labels = {
    "invoice processing" = { color = "aaaaaa", description = "" }
    "MOC 1.0"            = { color = "9f70a7", description = "" }
    "MOC 2.0"            = { color = "aaaaaa", description = "" }
    "MOC 2.0?"           = { color = "5f2521", description = "" }
  }
}

module "repo-ops-docs" {
  source      = "./modules/common_repository"
  name        = "ops-docs"
  description = "Operational policies and practices documentation for the Mass Open Cloud"

  teams = {
    "nercpis"  = "pull"
    "ops-core" = "admin"
  }

  labels = {
    "accepted"            = { color = "ededed", description = "" }
    "added_post_planning" = { color = "ccff4c", description = "" }
    "needs_description"   = { color = "ededed", description = "" }
    "size/extra large"    = { color = "5319e7", description = "Not been done before, new research, lot of time, risks to finishing in sprint, require extra help." }
    "size/extra small"    = { color = "9BCC95", description = "Most requirements are understood, relatively easy, likely completed in a day or less." }
    "size/large"          = { color = "16AE23", description = "Similar work done, complex, often requires assistance, commonly largest size done in sprint." }
    "size/medium"         = { color = "103AD3", description = "Similar work has been done before, it is clear what needs to be done, a few steps beyond a small." }
    "size/milestone"      = { color = "24653B", description = "needs to be broken down into multiple issues and a milestone created for it" }
    "size/small"          = { color = "c5def5", description = "Small thought and effort required, similar work has been done, or extra small with small unknown." }
  }
}

module "repo-ops-issues" {
  source          = "./modules/common_repository"
  name            = "ops-issues"
  description     = "High-level tracking of MOC operational issues"
  has_discussions = true

  teams = {
    "external-triage"          = "triage"
    "marcomm"                  = "triage"
    "nercdev"                  = "triage"
    "okd"                      = "triage"
    "open-source-contributors" = "triage"
    "ops-collab"               = "push"
    "ops-core"                 = "admin"
    "redhat"                   = "maintain"
  }

  labels = {
    "accepted"                               = { color = "ededed", description = "" }
    "added_post_planning"                    = { color = "ccff4c", description = "" }
    "blocked"                                = { color = "873719", description = "Include reason issue is blocked in the description" }
    "epic"                                   = { color = "BBDA16", description = "" }
    "flax"                                   = { color = "F0D3F7", description = "issues we are working on with Flax" }
    "GDPR"                                   = { color = "9f4f21", description = "" }
    "gitopsify"                              = { color = "e99695", description = "" }
    "mghpcc"                                 = { color = "5319e7", description = "MGHPCC related tasks" }
    "MOC 1.0"                                = { color = "9f70a7", description = "" }
    "MOC 2.0"                                = { color = "ededed", description = "" }
    "MOC 2.0?"                               = { color = "5f2521", description = "" }
    "monitoring"                             = { color = "4eed68", description = "" }
    "Multiple Production OpenShift Clusters" = { color = "780941", description = "" }
    "NAIRR"                                  = { color = "2301bc", description = "NAIRR — Tracks work associated with NAIRR research projects (NSF)" }
    "needs_clarification"                    = { color = "F5CA41", description = "This issue needs to be clarified" }
    "needs_description"                      = { color = "ededed", description = "" }
    "Networking & Security"                  = { color = "a62600", description = "" }
    "observability"                          = { color = "997D3E", description = "" }
    "Quickly integrating Lenovo GPUs"        = { color = "9c4242", description = "" }
    "research"                               = { color = "e99695", description = "This task is primarily about information discovery" }
    "security"                               = { color = "B60205", description = "Label for Security Issues" }
    "size/extra large"                       = { color = "5319e7", description = "Not been done before, new research, lot of time, risks to finishing in sprint, require extra help." }
    "size/extra small"                       = { color = "9BCC95", description = "Most requirements are understood, relatively easy, likely completed in a day or less." }
    "size/large"                             = { color = "16AE23", description = "Similar work done, complex, often requires assistance, commonly largest size done in sprint." }
    "size/medium"                            = { color = "103AD3", description = "Similar work has been done before, it is clear what needs to be done, a few steps beyond a small." }
    "size/milestone"                         = { color = "24653B", description = "needs to be broken down into multiple issues and a milestone created for it" }
    "size/small"                             = { color = "c5def5", description = "Small thought and effort required, similar work has been done, or extra small with small unknown." }
    "spike"                                  = { color = "C3DB0B", description = "evaluating the impact new technology has on the current implementation" }
    "Storage"                                = { color = "5bdae8", description = "" }
    "Technical Debt"                         = { color = "b6ff32", description = "" }
    "techsquare"                             = { color = "d93f0b", description = "" }
    "vendor-ticket"                          = { color = "1c946d", description = "To help keep track of issues that are associated with Vendor Tickets." }
    "website"                                = { color = "334A9E", description = "" }
  }
}

module "repo-ops-private" {
  source      = "./modules/common_repository"
  name        = "ops-private"
  description = "Private operational documentation for the Mass Open Cloud"
  visibility  = "private"
  has_wiki    = true

  teams = {
    "communications" = "triage"
    "ops-core"       = "maintain"
  }

  labels = {
    "AAA Test"            = { color = "e99695", description = "" }
    "accepted"            = { color = "ededed", description = "" }
    "added_post_planning" = { color = "ccff4c", description = "" }
    "blocked"             = { color = "873719", description = "Include reason issue is blocked in the description" }
    "Community Building"  = { color = "A1E35D", description = "Way to track Community/Team Building" }
    "MOC 1.0"             = { color = "9f70a7", description = "" }
    "MOC 2.0"             = { color = "ededed", description = "" }
    "MOC 2.0?"            = { color = "5f2521", description = "" }
    "Organized Training"  = { color = "402712", description = "Way to track organized training" }
    "Self-training"       = { color = "D20FA8", description = "Way to track self-training" }
  }
}

module "repo-papers" {
  source      = "./modules/common_repository"
  name        = "papers"
  description = "Academic papers and publications"
  visibility  = "private"
  has_issues  = false

  teams = {
    "paper_readers" = "pull"
    "writers"       = "push"
  }
  users = {
    "trevornogues" = "push"
  }

  labels = {
    "discussion" = { color = "ccd4ff", description = "" }
  }
}

module "repo-pfsense-firewall-ansible" {
  source      = "./modules/common_repository"
  name        = "pfsense-firewall-ansible"
  description = "Ansible playbooks to manage our pfsense firewalls"
  visibility  = "private"

  users = {
    "tzumainn" = "push"
  }
}

module "repo-pfsense-tools" {
  source      = "./modules/common_repository"
  name        = "pfsense-tools"
  description = "Tools for managing pfSense firewalls"
}

module "repo-racadm-scripts" {
  source      = "./modules/common_repository"
  name        = "racadm-scripts"
  description = "Some scripts for Dell machine provisioning using racadm"
}

module "repo-roce-testing" {
  source      = "./modules/common_repository"
  name        = "roce-testing"
  description = "Testing scripts for RoCE in the MOC/NERC"

  teams = {
    "redhat" = "maintain"
  }
}

module "repo-storage-benchmarks" {
  source      = "./modules/common_repository"
  name        = "storage-benchmarks"
  description = "Measuring NERC storage performance"
  has_wiki    = true
}

module "repo-virtualbmc" {
  source      = "./modules/common_repository"
  name        = "virtualbmc"
  description = "Virtual BMC for Ironic nodes using the IPMI protocol"
}

module "repo-open-accelerator-infra" {
  source      = "./modules/common_repository"
  name        = "oac-infra"
  description = "Infrastructure configuration for the open accelerator project"

  teams = {
    open-accelerator = "maintain"
  }
}

module "repo-oac-apps" {
  source      = "./modules/common_repository"
  name        = "oac-apps"
  description = "Cluster configuration for the Open Accelerator environment"

  teams = {
    open-accelerator = "maintain"
  }

  branch_protection = {
    required_reviews       = 1
    require_linear_history = true
    required_status_checks = [
      "pre-commit",
      "lint-and-test",
    ]
  }
}

module "repo-rhoso18-deployment" {
  source      = "./modules/common_repository"
  name        = "rhoso18-deployment"
  description = "Deployment scripts for RHOSO (openstack-on-openshift) 18"

  teams = {
    open-accelerator = "maintain"
  }

  users = {
    "tzumainn" = "admin"
  }
}

module "repo-moc-private" {
  source     = "./modules/common_repository"
  name       = "moc-private"
  visibility = "private"

  teams = {
    "ops-core" = "maintain"
  }
}

module "repo-pure-cosi" {
  source      = "./modules/common_repository"
  name        = "pure-cosi"
  description = "COSI driver for everpure flashblade"

  teams = {
    "open-source-contributors" = "pull"
    "ops-collab"               = "pull"
    "ops-core"                 = "pull"
  }

  users = {
    "naved001" = "admin"
  }
}

module "repo-moc-services-config" {
  source      = "./modules/common_repository"
  name        = "moc-services-config"
  description = "COSI driver for everpure flashblade"
  template = {
    owner      = "CCI-MOC"
    repository = "moc-template"
  }

  labels = {
    "github_actions" = { color = "000000", description = "Pull requests that update GitHub Actions code" }
    "dependencies"   = { color = "0366d6", description = "Pull requests that update a dependency file" }
  }
}

module "repo-coldfront-moc" {
  source      = "./modules/common_repository"
  name        = "coldfront-moc"
  description = "ColdFront container and kubernetes manifests for the MOC"
}

module "repo-moc-keycloak" {
  source      = "./modules/common_repository"
  name        = "moc-keycloak"
  description = "Keycloak configuration for sso.massopen.cloud"
  template = {
    owner      = "CCI-MOC"
    repository = "moc-template"
  }

  teams = {
    "keycloak-workers" = "maintain"
    "open-accelerator" = "push"
  }

  branch_protection = {
    required_reviews = 1
    required_status_checks = [
      "pre-commit",
      "bootstrap"
    ]
    require_linear_history = true
  }
}

module "repo-coldfront-openshift-operator" {
  source      = "./modules/common_repository"
  name        = "coldfront-openshift-operator"
  description = "Proof-of-concept for MOC Coldfront Openshift operator using Kopf"

  users = {
    "QuanMPhm" = "admin"
  }
}

module "repo-oac-user-docs" {
  source      = "./modules/common_repository"
  name        = "oac-user-docs"
  description = "Open Accelerator user documentation"

  teams = {
    "open-accelerator" = "push"
  }

  pages = {
    cname      = "docs.oac.massopen.cloud"
    build_type = "workflow"
  }
}
