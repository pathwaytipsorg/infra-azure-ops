variable "business_org" {
  description = "Business org in my company Pathway"
  default = "pathway"
  type = string
}

variable "environment" {
  description = "Environment variable used as a prefix"
  type = string
  default = "dev"
}

variable "res_grp_name"{
  description = "Resource Group Name"
  type = string
  default = "rg-default"
}

variable "location"{
  description = "Resource Group Location"
  type = string
  default = "Canada Central"
}