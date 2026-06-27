terraform {
  required_version = ">= 1.5.0"
}

module "context" {
  source = "../../../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "platform"
  owner       = "cloud-team"
  attributes  = ["network"]
}

module "name" {
  source = "../../../../modules/common/name"

  context       = module.context.context
  resource_type = "vnet"
  suffix        = "core"
}
