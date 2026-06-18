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

module "vnet" {
  source = "../../../../modules/azure/networking/vnet"

  name                = module.context.name
  resource_group_name = "rg-platform-dev"
  location            = "southeastasia"
  address_space       = ["10.20.0.0/16"]
  create_vnet         = false
  tags                = module.context.tags
}
