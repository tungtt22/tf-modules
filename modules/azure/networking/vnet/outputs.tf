output "vnet_id" {
  description = "ID of the created virtual network."
  value       = try(azurerm_virtual_network.this[0].id, null)
}

output "name" {
  description = "Virtual network name."
  value       = var.name
}
