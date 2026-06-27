terraform {
  required_version = ">= 1.5.0"
}

module "context" {
  source = "../../../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "platform"
  owner       = "cloud-team"
  attributes  = ["artifacts"]
}

module "bucket" {
  source = "../../../../modules/aws/storage/s3"

  bucket_name        = "${module.context.name}-demo"
  versioning_enabled = true
  tags               = module.context.tags
}
