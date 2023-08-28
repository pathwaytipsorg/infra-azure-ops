# Create Log Analytics Workspace. To store and analyze log data from various sources
resource "azurerm_log_analytics_workspace" "insights" {
  name                = "logs-${random_string.myrandom.id}"
  location            = azurerm_resource_group.rg_pathway.location
  resource_group_name = azurerm_resource_group.rg_pathway.name
  retention_in_days   = 30
}
