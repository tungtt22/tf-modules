output "value" {
  description = "Canonical name rendered from the configured name parts."
  value       = local.final_name
}

output "parts" {
  description = "Name parts used to build the final value."
  value       = local.base_parts
}
