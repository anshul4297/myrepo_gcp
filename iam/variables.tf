variable "org_id" {
  type = string
  description = "ID of an organization"
}

######### Group details #########

variable "org_admin_group" {
  type = set(string)
  description = "Name of organization admin group"
}

variable "billing_admin_group" {
  type = set(string)
  description = "Name of Billing admin group"
}

variable "network_admin_group" {
  type = set(string)
  description = "Name of Network admin group"
}

variable "logging_admin_group" {
  type = set(string)
  description = "Name of logging admin group"
}

variable "monitoring_admin_group" {
  type = set(string)
  description = "Name of Monitoring admin group"
}

variable "security_admin_group" {
  type = set(string)
  description = "Name of Security admin group"
}

######### Roles to assign in Groups ##########

variable "org_admin_group_roles" {
  type = set(string)
  description = "list of roles to assign in Group"
}

variable "billing_admin_group_roles" {
  type = set(string)
  description = "list of roles to assign in Group"
}

variable "network_admin_group_roles" {
  type = set(string)
  description = "list of roles to assign in Group"
}

variable "logging_admin_group_roles" {
  type = set(string)
  description = "list of roles to assign in Group"
}

variable "monitoring_admin_group_roles" {
  type = set(string)
  description = "list of roles to assign in Group"
}

variable "security_admin_group_roles" {
  type = set(string)
  description = "list of roles to assign in Group"
}

variable "emails" {
  type = map(list(string))
  default = {}
}