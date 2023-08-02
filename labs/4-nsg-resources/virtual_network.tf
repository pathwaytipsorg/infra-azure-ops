# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-nw"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_pathway.name
}