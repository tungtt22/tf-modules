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

module "vpc" {
  source = "../../../../modules/aws/networking/vpc"

  name       = module.context.name
  cidr_block = "10.10.0.0/16"
  create_vpc = false
  tags       = module.context.tags
}
