resource "github_repository" "dot-github" {
  name         = ".github"
  description  = "GitHub configuration for the CCI-MOC organization."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "admin-tools" {
  name         = "admin-tools"
  description  = "Internal system administration scripts/tools"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-k2k" {
  name         = "ansible-k2k"
  description  = "Ansible playbook for setting up Keystone-to-Keystone federation with DevStack"
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-moc-web" {
  name         = "ansible-moc-web"
  description  = "Ansible playbooks for the MOC web infrastructure"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-httpd" {
  name         = "ansible-role-httpd"
  description  = "Ansible role for configuring Apache HTTPD"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-mailman" {
  name         = "ansible-role-mailman"
  description  = "Ansible role for deploying Mailman mailing list software"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-moc-base" {
  name         = "ansible-role-moc-base"
  description  = "Ansible role for base configuration of MOC hosts"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-moc-control" {
  name         = "ansible-role-moc-control"
  description  = "Ansible role for configuring MOC control nodes"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-moc-firewall" {
  name         = "ansible-role-moc-firewall"
  description  = "Ansible role for configuring MOC firewall rules"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-moc-sshd" {
  name         = "ansible-role-moc-sshd"
  description  = "Ansible role for configuring SSH daemon on MOC hosts"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-podman" {
  name         = "ansible-role-podman"
  description  = "Ansible role for deploying Podman container runtime"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-repomirror" {
  name         = "ansible-role-repomirror"
  description  = "Ansible role for configuring RHEL repository mirrors"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-root-authorized-keys" {
  name         = "ansible-role-root-authorized-keys"
  description  = "Ansible role for managing root authorized SSH keys"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ansible-role-systemd" {
  name         = "ansible-role-systemd"
  description  = "Ansible role providing a systemd daemon-reload handler"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "atmosphere-ansible" {
  name         = "atmosphere-ansible"
  description  = "Ansible instance deployment code for Atmosphere"
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "cci-moc_github_io" {
  name         = "CCI-MOC.github.io"
  description  = "GitHub Pages site for the CCI-MOC organization"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "cephfs-provisioner-example" {
  name         = "cephfs-provisioner-example"
  description  = "Example CephFS provisioner deployment for Kubernetes"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "django-giji-auth" {
  name         = "django-giji-auth"
  description  = "Support Keystone Auth in GIJI"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "eng1-liberty" {
  name         = "eng1-liberty"
  description  = "OpenStack Liberty deployment for Engage1"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "flocx" {
  name         = "flocx"
  description  = "First Layer of the Open Cloud Exchange"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "flocx-design" {
  name         = "flocx-design"
  description  = "UI designs for FLOCX and ESI"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "flocx-keystone-dev" {
  name         = "flocx-keystone-dev"
  description  = "Docker-based Keystone development environment for FLOCX"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "flocx-market" {
  name         = "flocx-market"
  description  = "OpenStack marketplace service for FLOCX resource trading"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "flocx-matcher" {
  name         = "flocx-matcher"
  description  = "Resource matching service for the FLOCX marketplace"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "flocx-ui" {
  name         = "flocx-ui"
  description  = "Horizon plugin for managing FLOCX bids, offers, and contracts"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "giji-backend" {
  name         = "giji-backend"
  description  = "GIJI API Server"
  has_wiki     = false
  archived     = true
  has_projects = false
  homepage_url = "https://giji.massopen.cloud"
}

resource "github_repository" "giji-frontend" {
  name         = "giji-frontend"
  description  = "GIJI  web client"
  homepage_url = "https://giji.massopen.cloud"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "giji-rtwo" {
  name         = "giji-rtwo"
  description  = "a unified interface into multiple cloud providers."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "gui-backend" {
  name         = "GUI-Backend"
  description  = "MOC simple GUI built on top of Atmosphere "
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "gui-frontend" {
  name         = "GUI-Frontend"
  description  = "MOC simple GUI built on top of Troposphere"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "hil" {
  name         = "hil"
  description  = "Hardware Isolation Layer, formerly Hardware as a Service"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "hil-vpn" {
  name         = "hil-vpn"
  description  = "vpn microservice for use with HIL"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "kilo-puppet" {
  name         = "kilo-puppet"
  description  = "Puppet modules to configure openstack kilo"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ksproj" {
  name         = "ksproj"
  description  = "Project management system for OpenStack clouds"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "kumo-leasing" {
  name         = "kumo-leasing"
  description  = "Scripts for time-based node leasing and automatic release"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "m2" {
  name         = "m2"
  description  = "Bare Metal Imaging (Malleable Metal as a Service)"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc" {
  name         = "moc"
  description  = "Private repository for sensitive MOC configuration files"
  visibility   = "private"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-cnv-common" {
  name         = "moc-ansible-cnv-common"
  description  = "Ansible roles for managing MOC OpenShift clusters with CNV"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-idrac" {
  name         = "moc-ansible-idrac"
  description  = "Ansible playbooks for managing Dell iDRAC interfaces"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-infra" {
  name         = "moc-ansible-infra"
  description  = "Ansible playbooks for MOC infrastructure management"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-inventory" {
  name         = "moc-ansible-inventory"
  description  = "Ansible inventory for MOC infrastructure"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-mailman" {
  name         = "moc-ansible-mailman"
  description  = "Ansible collection for managing Mailman mailing lists"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-netbox" {
  name         = "moc-ansible-netbox"
  description  = "Ansible playbooks for populating MOC NetBox instance"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-ops-common" {
  name         = "moc-ansible-ops-common"
  description  = "Common Ansible roles for MOC operations"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-ansible-ssh" {
  name         = "moc-ansible-ssh"
  description  = "Ansible playbooks for SSH configuration on MOC hosts"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-billing" {
  name         = "moc-billing"
  description  = "Flask application for MOC resource allocation and usage reporting"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-forms" {
  name         = "moc-forms"
  description  = "Web forms for the Mass Open Cloud"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-prometheus" {
  name         = "moc-prometheus"
  description  = "Prometheus monitoring configuration for the MOC"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-public" {
  name         = "moc-public"
  description  = "Central repo for non-project specific information about the MOC"
  has_wiki     = true
  homepage_url = "http://massopencloud.org/"
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-pyslurm" {
  name         = "moc-pyslurm"
  description  = "Python Interface to Slurm"
  homepage_url = "https://slurm.schedmd.com"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-website" {
  name         = "moc-website"
  description  = "Development pipeline for the MOC WordPress website"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "mocbot-k8s" {
  name         = "mocbot-k8s"
  description  = "Kubernetes deployment for the MOC Slack bot"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "nova" {
  name         = "nova"
  description  = "OpenStack Compute (Nova)"
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
  homepage_url = "http://openstack.org"
}

resource "github_repository" "obmd" {
  name         = "obmd"
  description  = "OBM management microservice for use with HIL"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ocp-on-power9" {
  name         = "ocp-on-power9"
  description  = " OCP on Power 9 IL Project"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "old-ui" {
  name         = "old-UI"
  description  = "Legacy user interface for the MOC"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "openstack-quota-migration" {
  name         = "openstack-quota-migration"
  description  = "Tools for migrating OpenStack quotas between environments"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ore" {
  name         = "ORE"
  description  = "MOC OpenStack Research Environment"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "puppet-csail-examples" {
  name         = "puppet-csail-examples"
  description  = "a redacted version of puppet bits from CSAIL's Openstack deploy"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "puppet-internal" {
  name         = "puppet-internal"
  description  = "Puppet manifests for internal use."
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "puppetlabs-openstack" {
  name         = "puppetlabs-openstack"
  description  = "Puppet Labs Reference and Testing Deployment Module for OpenStack"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "python-flocxclient" {
  name         = "python-flocxclient"
  description  = "Python client for the FLOCX Market API"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "python-novaclient" {
  name         = "python-novaclient"
  description  = "Client library for OpenStack Compute API"
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
  homepage_url = "http://openstack.org"
}

resource "github_repository" "rhosp-director-config" {
  name         = "rhosp-director-config"
  description  = "Red Hat OpenStack Platform Director configuration files"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "service-directory" {
  name         = "service-directory"
  description  = "A software package that stores lists of the available services inside our cloud"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "setpass" {
  name         = "setpass"
  description  = "Microservice for setting initial OpenStack user passwords"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "sosreporter" {
  name         = "sosreporter"
  description  = "Ansible playbook for automating sosreport collection"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "sprint-tools" {
  name         = "sprint-tools"
  description  = "Task automation for MOC sprint planning"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "ui" {
  name         = "ui"
  description  = "Alternative OpenStack Dashboard to Horizon for the MOC"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "xdmod-cntr" {
  name         = "xdmod-cntr"
  description  = "A project to prototype the use of XDMOD with OpenStack and OpenShift on the MOC"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "zabbix-ceph" {
  name         = "zabbix-ceph"
  description  = "Place to keep scripts/tools for additional ceph monitoring in zabbix."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "zabbix-config" {
  name         = "zabbix-config"
  description  = "Repository for zabbix configuration file and deployment tools."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "zabbix-libvirt" {
  name         = "zabbix-libvirt"
  description  = "Zabbix monitoring scripts for virtual machines using the libvirt API"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "demo-esi-api" {
  name         = "demo-esi-api"
  description  = "For integrating with ESI for requesting bare metal servers"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi" {
  name         = "esi"
  description  = "Elastic Secure Infrastructure project"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-common" {
  name         = "esi-common"
  description  = "Shared OpenStack library for the ESI project"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-event-actions" {
  name         = "esi-event-actions"
  description  = "Event listener that runs scripts in response to messaging queue events"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-ha-config" {
  name         = "esi-ha-config"
  description  = "High availability configuration for ESI"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-leap" {
  name         = "esi-leap"
  description  = "ESI lease policy manager"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-pilot" {
  name         = "esi-pilot"
  description  = "Configuration and scripts for the ESI pilot deployment"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-pilot-cluster" {
  name         = "esi-pilot-cluster"
  description  = "ESI pilot cluster deployment configuration"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-rally-plugin" {
  name         = "esi-rally-plugin"
  description  = "Contains a plugin for running ESI commands with Rally"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-sandbox" {
  name         = "esi-sandbox"
  description  = "Standalone TripleO deployment for ESI development and testing"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esi-ui" {
  name         = "esi-ui"
  description  = "OpenStack Horizon plugin that supports ESI"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "esisdk" {
  name         = "esisdk"
  description  = "Unified SDK for ESI"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "moc-esi-network-config" {
  name         = "moc-esi-network-config"
  description  = "Ansible playbook for connecting ESI private networks to floating IPs"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "python-esiclient" {
  name         = "python-esiclient"
  description  = "OpenStack CLI extensions for simplified ESI workflows"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "python-esileapclient" {
  name         = "python-esileapclient"
  description  = "Python client for the ESI-Leap OpenStack Lease API"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-cloud-apps" {
  archived    = true
  name        = "cloud-apps"
  description = "Research on science and HPC application performance in cloud environments"
  visibility  = "private"
  has_wiki    = true
}

resource "github_repository" "repo-cloudman" {
  archived    = true
  name        = "cloudman"
  description = "Cloud manager for provisioning and managing compute clusters on cloud infrastructure"
  visibility  = "private"
  has_wiki    = true
}

resource "github_repository" "repo-ic-cloud-2013" {
  archived    = true
  name        = "ic-cloud-2013"
  visibility  = "private"
  description = "Towards a Cloud Marketplace paper"
}

resource "github_repository" "repo-mghpcc" {
  archived    = true
  name        = "MGHPCC"
  description = "Scripts for collecting and archiving MassDOT data feeds at MGHPCC"
  has_issues  = false
}

resource "github_repository" "repo-mlsc" {
  archived    = true
  name        = "mlsc"
  description = "mslc operations"
  visibility  = "private"
}

resource "github_repository" "repo-nsf-13-602" {
  archived    = true
  name        = "NSF-13-602"
  description = "NSF 13-602 grant proposal materials"
  visibility  = "private"
}

resource "github_repository" "repo-nsf-ccc" {
  archived    = true
  name        = "NSF-CCC"
  description = "NSF Computing Community Consortium proposal materials"
  visibility  = "private"
}

resource "github_repository" "repo-seccloud_13" {
  archived    = true
  name        = "seccloud_13"
  description = "Secure Cloud OpenStack 13 deployment configuration"
  visibility  = "private"
}


resource "github_repository" "repo-ocx-library" {
  name         = "ocx-library"
  description  = "Client library for Open Cloud Exchange services"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-engage1" {
  name         = "Engage1"
  description  = "Engage1 project collaboration and documentation"
  visibility   = "private"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-haas-ui" {
  name         = "haas-ui"
  description  = "Django-based UI for HaaS"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-k2k-fed" {
  name         = "k2k-fed"
  description  = "k2k federation automation"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-sensu-checks" {
  name         = "sensu-checks"
  description  = "Sensu monitoring checks for compute, controller, and Ceilometer nodes"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-k2k-proxy" {
  name         = "k2k-proxy"
  description  = "K2K-Aware Proxy for OpenStack"
  has_wiki     = false
  homepage_url = "http://k2k-proxy.readthedocs.io"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-openshift" {
  name         = "openshift"
  description  = "OpenShift installation guides and image build sources"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-cici2017" {
  name         = "cici2017"
  description  = "proposal"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-chromogenic" {
  name         = "chromogenic"
  description  = "The chromogenic cloud library can be used to create machine images from instances or existing images and make them portable across providers, as well as support for exporting to localized virtualization (i.e. Virtualbox/VMware)."
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-rfi-iarpa-seccloud-17" {
  name         = "RFI-iarpa-seccloud-17"
  description  = "response to RFI from IARPA-RFI-17-04"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-mocmon" {
  name         = "mocmon"
  description  = "Sensu monitoring configuration for the MOC"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-osprofiler" {
  name         = "osprofiler"
  description  = "OpenStack cross service/project profiler"
  has_issues   = false
  has_wiki     = false
  homepage_url = "http://openstack.org"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-partner_y3" {
  name         = "partner_y3"
  description  = "1 page reports to partners for end of year 3"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-notmonero" {
  name         = "notmonero"
  description  = "Research on Monero cryptocurrency privacy attacks and countermeasures"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-tracing" {
  name         = "tracing"
  description  = "OpenStack distributed tracing research and configuration"
  visibility   = "private"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-hpc" {
  name         = "hpc"
  description  = "HPC infrastructure planning and documentation"
  visibility   = "private"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-cloud_dataverse" {
  name         = "cloud_dataverse"
  description  = "repository for papers for cloud data verse"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-clank" {
  name         = "clank"
  description  = "clankity clankity clankity clank"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-openstackwatcher" {
  name         = "moc-OpenstackWatcher"
  description  = "OpenStack resource monitoring and alerting"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-clouddv" {
  name         = "cloudDV"
  description  = "Anything Cloud Dataverse"
  visibility   = "private"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-e1-metrics" {
  name         = "e1-metrics"
  description  = "Any source code for metrics related software of Engage1"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-mocosppuppet" {
  name         = "MOCOSPpuppet"
  description  = "Puppet manifests for MOC OpenStack Platform deployment"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-nsf-18-531" {
  name         = "NSF-18-531"
  description  = "NSF 18-531 grant proposal materials"
  visibility   = "private"
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-seccloud" {
  name         = "seccloud"
  description  = "Secure Cloud stuff"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-keystone-migration" {
  name         = "keystone-migration"
  description  = "Tools for migrating users between Keystone installations"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-openshift-tools" {
  name         = "moc-openshift-tools"
  description  = "Scripts and configurations for OpenShift setup and maintenance"
  visibility   = "private"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-abmi" {
  name         = "ABMI"
  description  = "Agentless Bare-Metal Introspection"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-wordpress" {
  name         = "moc-wordpress"
  description  = "MOC Wordpress site"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-kaizen-metrics" {
  name         = "kaizen-metrics"
  description  = "OpenStack usage metrics and charts for the Kaizen cluster"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-nsf-19-512-open-cloudlab" {
  name         = "NSF-19-512-Open-CloudLab"
  description  = "NSF CCRI proposal for Open CloudLab"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-ovirt-scripts" {
  name         = "ovirt-scripts"
  description  = "Repository to store our ovirt/rhev related configuration files and scripts."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-openstack-tools" {
  name         = "moc-openstack-tools"
  description  = "Tools for OpenStack administration, user/project management, etc."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-rhosp-13-post-deploy" {
  name         = "rhosp-13-post-deploy"
  description  = "Post-deployment scripts for Red Hat OpenStack Platform 13"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-logstash-config" {
  name         = "logstash-config"
  description  = "Logstash configuration files for log aggregation"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-2020-nsf-convergence" {
  name         = "2020-NSF-convergence"
  description  = "NSF 2020 Convergence Accelerator proposal materials"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-openstack-validation" {
  name         = "openstack-validation"
  description  = "Ansible playbooks for testing OpenStack cloud features"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-repomirror-rhel-6" {
  name         = "repomirror-rhel-6"
  description  = "RHEL 6 repository mirror configuration"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-ovirt-servers" {
  name         = "ovirt-servers"
  description  = "oVirt/RHEV server configuration"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-postgres-k8s-example" {
  name         = "postgres-k8s-example"
  description  = "Example PostgreSQL deployment in Kubernetes"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-sprint-notes" {
  name         = "sprint-notes"
  description  = "Sprint planning notes and meeting records"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-rubicon-issues" {
  name         = "rubicon-issues"
  description  = "Issue tracking for the Rubicon project"
  has_wiki     = true
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-adjutant" {
  name         = "adjutant"
  description  = "A simple workflow framework to help automate admin and user tasks in and around OpenStack via a pluggable API exposing tasks made up of easily chainable actions."
  has_issues   = false
  has_wiki     = false
  homepage_url = "http://openstack.org"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-rucs-paper" {
  name         = "RUCS-Paper"
  description  = "RUCS paper"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-reporting" {
  name         = "reporting"
  description  = "OpenStack utilization reporting and billing tools for the MOC"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-curator-openshift-infra" {
  name         = "curator-openshift-infra"
  description  = "OpenShift infrastructure management using Curator"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-curator-openshift-install" {
  name         = "curator-openshift-install"
  description  = "OpenShift installation automation using Curator"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-wp-plugin" {
  name         = "moc-wp-plugin"
  description  = "WordPress plugin for MOC site customizations"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-adjutant-moc" {
  archived = true
  name        = "adjutant-moc"
  description = "MOC Onboarding plugin for Adjutant"
  has_wiki    = true
}

resource "github_repository" "repo-horizon-onboarding" {
  archived = true
  name        = "horizon-onboarding"
  description = "Horizon-based Dashboard for MOC Onboarding"
}

resource "github_repository" "repo-prototype-reporting" {
  name         = "prototype-reporting"
  description  = "A prototype reporting project"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-service-tag-lookup" {
  name         = "service-tag-lookup"
  description  = "Server inventory lookup by Dell service tag or HP serial number"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-ocp-prod-openshift-install" {
  name         = "ocp-prod-openshift-install"
  description  = "Holds the necessary files required for our production OCP installation"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc_theme" {
  name         = "moc_theme"
  description  = "Horizon theme"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-project-api-spec" {
  name         = "moc-project-api-spec"
  description  = "OpenAPI specification for a project management API"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-hadhcp" {
  name         = "hadhcp"
  description  = "Highly available DHCP service using ISC DHCPd"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-k8s-tools-image" {
  name         = "k8s-tools-image"
  description  = "Container image with Kubernetes and OpenShift management tools"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-project-tool" {
  name         = "moc-project-tool"
  description  = "Ansible tool for managing OpenShift projects, quotas, and groups"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-objects-for-all" {
  name         = "objects-for-all"
  description  = "Grant proposal 2019"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-onboarding-tools" {
  name         = "onboarding-tools"
  description  = "Tools and testing for MOC Onboarding."
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-openshift-schemas" {
  name         = "openshift-schemas"
  description  = "JSON schemas for OpenShift resource validation with Kubeval"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-coldfront-plugin-allocation-api" {
  name         = "coldfront-plugin-allocation-api"
  description  = "ColdFront plugin providing an allocation API"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-sso" {
  name         = "sso"
  description  = "Ansible automation for deployment of SSO"
  has_wiki     = true
  homepage_url = "https://sso.massopen.cloud"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-virtual-desktop-docs" {
  name         = "virtual-desktop-docs"
  description  = "Documentation for the Shaw University Virtual Desktop deployment on MOC"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-nerc-migration-image" {
  name         = "moc-nerc-migration-image"
  description  = "Scripts to build an image for OpenStack volume migrations"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-doe-2022-objects" {
  name         = "DOE-2022-objects"
  description  = "DOE 2022 object storage proposal materials"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-netbox-docker-plugins" {
  name         = "netbox-docker-plugins"
  description  = "🐳  Docker Image of NetBox, with MOC plugins included"
  has_issues   = false
  has_wiki     = false
  homepage_url = "https://github.com/netbox-community/netbox-docker/wiki"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-netbox-topology" {
  name         = "netbox-topology"
  description  = "Image from https://github.com/netbox-community/netbox-docker extended with topology plugin"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-quotes" {
  name         = "quotes"
  description  = "Quotes for MOC Alliance"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-image-workflow-example" {
  name         = "image-workflow-example"
  description  = "Example of automated Docker image building and tagging with GitHub workflows"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-switch-ansible" {
  name         = "moc-switch-ansible"
  description  = "Ansible playbooks for network switches"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-apps" {
  name         = "moc-apps"
  description  = "ArgoCD applications deployed on MOC managed OpenShift clusters"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-johonnot-pdf-to-csv" {
  name         = "johonnot-pdf-to-csv"
  description  = "Script to convert wipe report PDFs into a csv file"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-openshift-projects" {
  name         = "moc-openshift-projects"
  description  = "Project management for the MOC production OpenShift cluster"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-moc-iam" {
  name         = "moc-iam"
  description  = "AWS IAM configuration for the Mass Open Cloud"
  visibility   = "private"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-hammerdb" {
  name         = "HammerDB"
  description  = "HammerDB Database Load Testing and Benchmarking Tool"
  has_issues   = false
  has_wiki     = false
  homepage_url = "http://www.hammerdb.com"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-netbox-sync" {
  name         = "netbox-sync"
  description  = "Script to sync two netbox sites for specific cabinets"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-nerc-bmh" {
  name         = "nerc-bmh"
  description  = "Bare metal host configuration for NERC OpenShift"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-mariadb-nese-test" {
  name         = "mariadb-nese-test"
  description  = "Docker files for mariadb tests with NESE"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-ocp-nerc-storage-tests" {
  name         = "ocp-nerc-storage-tests"
  description  = "Manifests for Storage Tests run on NERC Infra"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-k-hammer" {
  name         = "k-hammer"
  description  = "Kubernetes jobs for running HammerDB database benchmarks"
  has_wiki     = false
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-coldfront" {
  name         = "coldfront"
  description  = "HPC Resource Allocation System"
  has_issues   = false
  has_wiki     = false
  homepage_url = "https://coldfront.readthedocs.io"
  archived     = true
  has_projects = false
}

resource "github_repository" "repo-al-folio" {
  name         = "al-folio"
  description  = "A beautiful, simple, clean, and responsive Jekyll theme for academics"
  has_issues   = false
  has_wiki     = false
  archived     = true
  has_projects = false
}
