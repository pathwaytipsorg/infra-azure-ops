resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "${azurerm_resource_group.rg_pathway.name}-cluster"
  location            = azurerm_resource_group.rg_pathway.location
  resource_group_name = azurerm_resource_group.rg_pathway.name
  dns_prefix          = "${azurerm_resource_group.rg_pathway.name}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.rg_pathway.name}-nrg"

  default_node_pool {
    name                 = "systempool"
    vm_size              = "Standard_DS2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    zones = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 2
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepoolos"       = "linux"
      "app"              = "system-apps" 
    } 
   tags = {
      "nodepool-type"    = "system"
      "environment"      = "dev"
      "nodepoolos"       = "linux"
      "app"              = "system-apps" 
   } 
  }

# Identity (System Assigned or Service Principal): Here system will assign a managed identity to the cluster.
  identity {
    type = "SystemAssigned"
  }

# To configure Log Analytics integration for monitoring and insights.
oms_agent {
  log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
}

azure_active_directory_role_based_access_control {
  managed = true
  admin_group_object_ids = [azuread_group.aks_administrators.id]
}

  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

# Network Profile
  network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }

  tags = {
    Environment = var.environment
  }
}
