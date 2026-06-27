module "name" {
  source = "../name"

  context       = var.context
  namespace     = var.namespace
  environment   = var.environment
  application   = var.application
  attributes    = var.attributes
  prefix        = var.prefix
  name          = var.name
  resource_type = var.resource_type
  suffix        = var.suffix
  extra_parts   = var.extra_name_parts
  delimiter     = var.delimiter
  lowercase     = var.lowercase
  max_length    = var.max_length
}

locals {
  effective_namespace   = var.namespace != null ? var.namespace : try(var.context.namespace, null)
  effective_environment = var.environment != null ? var.environment : try(var.context.environment, null)
  effective_application = var.application != null ? var.application : try(var.context.application, null)
  effective_owner       = var.owner != null ? var.owner : try(var.context.owner, null)
  effective_attributes  = length(var.attributes) > 0 ? var.attributes : try(var.context.attributes, [])
  inherited_tags        = try(var.context.tags, {})

  standard_metadata = {
    namespace           = local.effective_namespace
    environment         = local.effective_environment
    application         = local.effective_application
    owner               = local.effective_owner
    managed_by          = var.managed_by
    workload            = var.workload
    cost_center         = var.cost_center
    business_unit       = var.business_unit
    data_classification = var.data_classification
    compliance_domain   = var.compliance_domain
  }

  metadata = merge(
    { for key, value in local.standard_metadata : key => value if value != null && trimspace(value) != "" },
    var.additional_metadata
  )

  merged_tags   = merge(local.inherited_tags, local.metadata, var.tags)
  merged_labels = merge(local.inherited_tags, local.metadata, var.labels)
}
