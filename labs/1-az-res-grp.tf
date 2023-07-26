# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_version =">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
}

# 2. Configure the AzureRM Provider
provider "azurerm" {
  features {}
}

# 3. Create a resource group
resource "azurerm_resource_group" "my-demo" {
  name     = "my-demo-resources"
  location = "Central US"
}

# 4. Create a virtual network within the resource group
resource "azurerm_virtual_network" "my-demo" {
  name                = "my-demo-network"
  resource_group_name = azurerm_resource_group.my-demo.name
  location            = azurerm_resource_group.my-demo.location
  address_space       = ["10.0.0.0/16"]
  
}
