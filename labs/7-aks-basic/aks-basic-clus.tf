resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.clus_prefix}-k8s"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_pathway.name
  dns_prefix          = "${var.clus_prefix}-k8s"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}