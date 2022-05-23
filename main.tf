locals {
  environment    = var.environment == null ? try(data.azurerm_subscription.main.tags.environment, "Error: No valid Enviroment Found") : var.environment
  costcenter     = var.costcenter == "" ? try(data.azurerm_subscription.main.tags.costcenter, "Error: Can Not Find Cost Center Tag on Subscription") : var.costcenter
  rg     = var.override_rg_name == null ? local.generation == "gen1" ? lower("${var.brand}-${local.environment}-${local.project_name}") : lower("${local.environment}-${random_string.main[0].result}") : var.override_rg_name
  module_version = file("${path.module}/VERSION")
  default_tags = {
    costcenter     = local.costcenter
    projectcode    = var.projectcode
    environment    = local.environment
    deployed_using = "Terraform - terraform-azurerm-rg ${local.module_version}"
    } 
}
data "azurerm_subscription" "main" {
}

resource "azurerm_resource_group" "rg" {
  for_each = var.locations
  name     = var.override_rg_name == null ? lower(format("%s--rg", local.rg)) : lower(format("%s-rg", var.override_rg_name))
  location = each.value.locations
  tags     = merge({ location = "Central US" }, local.default_tags, var.tags, )
}
