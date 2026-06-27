terraform {
  required_version = ">= 1.5.0"
}

module "context" {
  source = "../../../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "website"
  owner       = "cloud-team"
  attributes  = ["static"]
}

module "website_bucket" {
  source = "../../../../modules/aws/storage/s3"

  bucket_name                   = "${module.context.name}-demo"
  website_enabled               = true
  website_public_access_enabled = true
  website_index_document        = "index.html"
  website_error_document        = "404.html"
  tags                          = module.context.tags
}
