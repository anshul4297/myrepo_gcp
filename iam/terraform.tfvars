org_id  = ""

######## Group details ########
org_admin_group = ["group:gcp-organization-admins@queensview.joonix.net"] 
billing_admin_group = ["group:gcp-billing-admins@queensview.joonix.net"]
network_admin_group = ["group:gcp-network-admins@queensview.joonix.net"]
logging_admin_group = ["group:gcp-logging-admins@queensview.joonix.net"]
monitoring_admin_group = ["group:gcp-monitoring-admins@queensview.joonix.net"]
security_admin_group = ["group:gcp-security-admins@queensview.joonix.net"]

######## Roles to assign in groups ##########
org_admin_group_roles = ["roles/resourcemanager.organizationAdmin", "roles/resourcemanager.folderAdmin", "roles/resourcemanager.projectCreator", "roles/billing.user", "roles/iam.organizationRoleAdmin", "roles/orgpolicy.policyAdmin", "roles/securitycenter.admin", "roles/cloudsupport.admin"]
billing_admin_group_roles = ["roles/billing.admin", "roles/billing.creator", "roles/resourcemanager.organizationViewer"]
network_admin_group_roles = ["roles/compute.networkAdmin", "roles/compute.xpnAdmin", "roles/compute.securityAdmin", "roles/resourcemanager.folderViewer"]
logging_admin_group_roles = ["roles/logging.admin"]
monitoring_admin_group_roles = ["roles/monitoring.admin"]
security_admin_group_roles = ["roles/orgpolicy.policyAdmin", "roles/iam.securityReviewer", "roles/iam.organizationRoleViewer", "roles/securitycenter.admin", "roles/resourcemanager.folderIamAdmin", "roles/logging.privateLogViewer", "roles/logging.configWriter", "roles/container.viewer", "roles/compute.viewer"]


emails = {
  "email1" = ["group:anshul-group@gmail.com"],
  "email2" = ["group:test-group@gmail.com"]
}