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
  source = "../../../../modules/gcp/networking/vpc"

  name                    = module.context.name
  project_id              = "acme-dev"
  auto_create_subnetworks = false
  create_network          = false
}
