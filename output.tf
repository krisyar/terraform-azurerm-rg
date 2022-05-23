output "resource_group_id" {
  value = azurerm_resource_group.rg.id
  description = "The Resource Group ID"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
  description = "The Resource Group Name"
}

output "rg_cc_location" {
  value       = azurerm_resource_group.rg..location
  description = "The Resource Group Location"
}
