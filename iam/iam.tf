########## To assign organisation role to iam member or vice versa ###########
####### Organization admin group role binding ########

# module "organization-iam-bindings" {
#   source        = "../modules/iam"
#   organizations = [""]
#   mode          = "authoritative"

#   bindings = {
#     "roles/resourcemanager.organizationAdmin" = [
#       local.group1,
#     ]
#     "roles/resourcemanager.folderAdmin" = [
#       local.group1,
#     ]
#     "roles/resourcemanager.projectCreator" = [
#       local.group1,
#     ]
#     "roles/billing.user" = [
#       local.group1,
#     ]
#     "roles/iam.organizationRoleAdmin" = [
#       local.group1,
#     ]
#     "roles/orgpolicy.policyAdmin" = [
#       local.group1,
#     ]
#     "roles/securitycenter.admin" = [
#       local.group1,
#     ]
#     "roles/cloudsupport.admin" = [
#       local.group1,
#     ]

#   }
# }

# ####### Billing admin group role binding ########

# module "billing-iam-bindings" {
#   source        = "../modules/iam"
#   organizations = [""]
#   mode          = "authoritative"

#   bindings = {
#     "roles/billing.admin" = [
#       local.group2,
#     ]
#     "roles/billing.creator" = [
#       local.group2,
#     ]
#     "roles/resourcemanager.organizationViewer" = [
#       local.group2,
#     ]

#   }
# }

# ####### Network admin group role binding ########

# module "network-iam-bindings" {
#   source        = "../modules/iam"
#   organizations = [""]
#   mode          = "authoritative"

#   bindings = {
#     "roles/compute.networkAdmin" = [
#       local.group3,
#     ]
#     "roles/compute.xpnAdmin" = [
#       local.group3,
#     ]
#     "roles/compute.securityAdmin" = [
#       local.group3,
#     ]
#     "roles/resourcemanager.folderViewer" = [
#       local.group3,
#     ]

#   }
# }

# ####### Logging admin group role binding ########

# module "logging-iam-bindings" {
#   source        = "../modules/iam"
#   organizations = [""]
#   mode          = "authoritative"

#   bindings = {
#     "roles/logging.admin" = [
#       local.group4,
#     ]
#   }
# }

# ####### Monitoring admin group role binding ########

# module "Monitoring-iam-bindings" {
#   source        = "../modules/iam"
#   organizations = [""]
#   mode          = "authoritative"

#   bindings = {
#     "roles/monitoring.admin" = [
#       local.group5,
#     ]
#   }
# }

# ####### Security admin group role binding ########

# module "Security-iam-bindings" {
#   source        = "../modules/iam"
#   organizations = [""]
#   mode          = "authoritative"

#   bindings = {
#     "roles/orgpolicy.policyAdmin" = [
#       local.group6,
#     ]
#     "roles/iam.securityReviewer" = [
#       local.group6,
#     ]
#     "roles/iam.organizationRoleViewer" = [
#       local.group6,
#     ]
#     "roles/securitycenter.admin" = [
#       local.group6,
#     ]
#     "roles/resourcemanager.folderIamAdmin" = [
#       local.group6,
#     ]
#     "roles/logging.privateLogViewer" = [
#       local.group6,
#     ]
#     "roles/logging.configWriter" = [
#       local.group6,
#     ]
#     "roles/container.viewer" = [
#       local.group6,
#     ]
#     "roles/compute.viewer" = [
#       local.group6,
#     ]
#   }
# }


####### Group bindings with multiple roles ########

# resource "google_project_iam_member" "member-role" {
#   for_each = toset([
#     "roles/cloudsql.admin",
#     "roles/secretmanager.secretAccessor",
#     "roles/datastore.owner",
#     "roles/storage.admin",
#   ])
#   role = each.key
#   member = "serviceAccount:${google_service_account.service_account_1.email}"
#   project = my_project_id
# }

# resource "google_organization_iam_binding" "org_admin_role" {
#   org_id  = var.org_id
#   for_each = var.org_admin_group_roles
#   role     = each.value
#   members  = local.group1
# }

# resource "google_organization_iam_binding" "billing_admin_role" {
#   org_id  = var.org_id
#   for_each = var.billing_admin_group_roles
#   role     = each.value
#   members  = local.group2
# }

# resource "google_organization_iam_binding" "network_admin_role" {
#   org_id  = var.org_id
#   for_each = var.network_admin_group_roles
#   role     = each.value
#   members  = local.group3
# }

# resource "google_organization_iam_binding" "logging_admin_role" {
#   org_id  = var.org_id
#   for_each = var.logging_admin_group_roles
#   role     = each.value
#   members  = local.group4
# }

# resource "google_organization_iam_binding" "monitoring_admin_role" {
#   org_id  = var.org_id
#   for_each = var.monitoring_admin_group_roles
#   role     = each.value
#   members  = local.group5
# }

# resource "google_organization_iam_binding" "security_admin_role" {
#   org_id  = var.org_id
#   for_each = var.security_admin_group_roles
#   role     = each.value
#   members  = local.group6
# }

######  testing

resource "google_organization_iam_binding" "security11_admin_role" {
  org_id  = var.org_id
  for_each = var.security_admin_group_roles
  role     = each.value
  members  = var.emails.email1
}

resource "google_organization_iam_binding" "test_admin_role" {
  org_id  = var.org_id
  for_each = var.security_admin_group_roles
  role     = each.value
  members  = var.emails.email2
}