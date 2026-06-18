locals {
  base_parts = [
    var.namespace,
    var.environment,
    var.application,
  ]

  name_parts = concat(local.base_parts, var.attributes)

  normalized_name = lower(join("-", [for part in local.name_parts : trimspace(part) if trimspace(part) != ""]))

  common_tags = merge(
    {
      namespace   = var.namespace
      environment = var.environment
      application = var.application
      owner       = var.owner
      managed_by  = "terraform"
    },
    var.tags
  )
}
