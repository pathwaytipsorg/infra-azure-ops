/*  
local variables for organizational and environmental context, 
as well as a resource name prefix, 
and creates project-specific tags using input variables.
*/
locals {
  owners = var.business_org
  environment = var.environment
  res_name_prefix = "${local.owners}-${local.environment}"
  proj_tags = {
    owners = local.owners
    environment = local.environment
  }
} 