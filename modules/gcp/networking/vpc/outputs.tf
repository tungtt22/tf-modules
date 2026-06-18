output "network_id" {
  description = "ID of the created network."
  value       = try(google_compute_network.this[0].id, null)
}

output "name" {
  description = "Network name."
  value       = var.name
}
