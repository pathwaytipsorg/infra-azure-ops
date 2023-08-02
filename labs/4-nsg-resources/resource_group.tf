resource "azurerm_resource_group" "rg_pathway" {
  name     = "${var.business_org}-${var.res_grp_name}-${random_string.myrandom.id}"
  location = var.location
}