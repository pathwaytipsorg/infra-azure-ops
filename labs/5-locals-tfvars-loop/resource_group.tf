// Defines an Azure Resource Group with a dynamic name and specified location, using project tags.
resource "azurerm_resource_group" "rg_pathway" {
  name     = "${var.res_name_prefix}-${var.res_grp_name}-${random_string.myrandom.id}"
  location = var.location
  tags = local.proj_tags
}