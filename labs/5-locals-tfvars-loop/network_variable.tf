variable "vnet_name" {
  description = "Virtual Network name"
  type = string
  default = "vnet-default"
}

variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "web_subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = string
  default = "web-subnet-name"
}
# Web Subnet Address Space
variable "web_subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type = list(string)
  default = ["10.0.1.0/24"]
}