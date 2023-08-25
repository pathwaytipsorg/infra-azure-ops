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

# AKS Input Variables

# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "C:/Users/varun/.ssh/aks-prod-sshkeys-terraform/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"  
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "PathwayTips@102" 
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}