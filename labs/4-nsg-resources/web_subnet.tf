resource "azurerm_subnet" "web_subnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg_pathway.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = var.web_subnet_address
}


resource "azurerm_network_security_group" "web_subnet_nsg" {
  name                = "${azurerm_subnet.web_subnet.name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_pathway.name
}

resource "azurerm_network_security_rule" "web_nsg_rule_outbound" {
  name                        = "test123"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rg_pathway.name
  network_security_group_name = azurerm_network_security_group.web_subnet_nsg.name
}

resource "azurerm_subnet_network_security_group_association" "web_subnet_nsg_associate" {
  subnet_id                 = azurerm_subnet.web_subnet.id
  network_security_group_id = azurerm_network_security_group.web_subnet_nsg.id
}