variable "business_org" {
  description = "Business org in my company Pathway"
  default = "buss-org"
  type = string
}

variable "environment" {
  description = "Environment variable used as a prefix"
  type = string
  default = "env"
}

/*
variable "res_name_prefix"{
  description = "Resource Prefix"
  type = string
  default = "business-grp-name"
}*/

variable "res_grp_name"{
  description = "Resource Group Name"
  type = string
  default = "res-grp-name"
}

variable "location"{
  description = "Resource Group Location"
  type = string
  default = "Canada Central"
}

variable "vm_ref"{
  description = "Virtual Machine Reference"
  type = string
}