# Datasource to get Latest Azure AKS latest Version. "az aks get-versions --location canadacentral -o table"
data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.rg_pathway.location
  include_preview = false
}

