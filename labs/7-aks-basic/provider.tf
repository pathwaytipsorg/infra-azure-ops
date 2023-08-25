# Specify the version of the AzureRM Provider to use
terraform {
  required_version =">= 1.0.0" 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0.0" 
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}