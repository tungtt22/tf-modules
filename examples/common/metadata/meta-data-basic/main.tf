terraform {
  required_version = ">= 1.5.0"
}

module "context" {
  source = "../../../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "platform"
  owner       = "cloud-team"
  attributes  = ["shared"]
}

module "meta_data" {
  source = "../../../../modules/common/meta_data"

  context             = module.context.context
  cost_center         = "cc-1234"
  business_unit       = "platform"
  data_classification = "internal"
  resource_type       = "config"
}
