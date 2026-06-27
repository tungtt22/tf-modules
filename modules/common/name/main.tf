locals {
  effective_namespace   = var.namespace != null ? var.namespace : try(var.context.namespace, null)
  effective_environment = var.environment != null ? var.environment : try(var.context.environment, null)
  effective_application = var.application != null ? var.application : try(var.context.application, null)
  effective_attributes  = length(var.attributes) > 0 ? var.attributes : try(var.context.attributes, [])

  base_parts = concat(
    [for value in [var.prefix, local.effective_namespace, local.effective_environment, local.effective_application] : trimspace(value) if value != null && trimspace(value) != ""],
    [for value in local.effective_attributes : trimspace(value) if trimspace(value) != ""],
    [for value in concat(var.extra_parts, [var.name, var.resource_type, var.suffix]) : trimspace(value) if value != null && trimspace(value) != ""]
  )

  rendered_name   = join(var.delimiter, local.base_parts)
  normalized_name = var.lowercase ? lower(local.rendered_name) : local.rendered_name
  final_name      = var.max_length == null ? local.normalized_name : substr(local.normalized_name, 0, min(length(local.normalized_name), var.max_length))
}
