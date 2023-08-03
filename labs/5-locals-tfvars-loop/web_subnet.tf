// Creates an Azure subnet within a virtual network for web resources.
resource "azurerm_subnet" "web_subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg_pathway.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = var.web_subnet_address
}

// Establishes a network security group for the web subnet.
resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "${azurerm_subnet.web_subnet.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_pathway.name
}

// Defines outbound port mappings for web traffic.
locals {
  web_outbound_ports = {
    "100" : "80", 
    "110" : "443",
    "120" : "22"
  } 
}

// Creates outbound network security rules for web traffic.
resource "azurerm_network_security_rule" "web_nsg_rule_outbound" {
  for_each = local.web_outbound_ports
  name                        = "rule-port-${each.value}"
  priority                    = each.key
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_pathway.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}

// Associates the web subnet with the network security group.
resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
}