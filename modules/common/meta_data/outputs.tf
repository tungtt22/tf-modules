output "name" {
  description = "Canonical name rendered from the shared context and optional resource-specific parts."
  value       = module.name.value
}

output "tags" {
  description = "Merged metadata map for providers that use tags."
  value       = local.merged_tags
}

output "labels" {
  description = "Merged metadata map for providers that use labels."
  value       = local.merged_labels
}

output "metadata" {
  description = "Normalized metadata object."
  value = merge(
    local.metadata,
    {
      name       = module.name.value
      attributes = local.effective_attributes
    }
  )
}
