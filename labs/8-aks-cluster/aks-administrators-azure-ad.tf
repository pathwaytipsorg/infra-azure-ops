# Create Azure AD Group in Active Directory for AKS Admins. For managing and granting administrative access to an Azure Kubernetes Service (AKS) cluster.
resource "azuread_group" "aks_administrators" {
  display_name = "${azurerm_resource_group.rg_pathway.name}-cluster-administrators"
  security_enabled = true
  description = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.rg_pathway.name}-cluster."
}
