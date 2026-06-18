output "name" {
  description = "Normalized name built from namespace, environment, application, and attributes."
  value       = local.normalized_name
}

output "tags" {
  description = "Merged standard tags or labels for downstream modules."
  value       = local.common_tags
}

output "context" {
  description = "Full context object for downstream composition."
  value = {
    namespace   = var.namespace
    environment = var.environment
    application = var.application
    owner       = var.owner
    attributes  = var.attributes
    name        = local.normalized_name
    tags        = local.common_tags
  }
}
