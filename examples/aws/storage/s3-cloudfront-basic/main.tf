terraform {
  required_version = ">= 1.5.0"
}

module "context" {
  source = "../../../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "platform"
  owner       = "cloud-team"
  attributes  = ["static"]
}

module "bucket" {
  source = "../../../../modules/aws/storage/s3"

  bucket_name = "${module.context.name}-origin-demo"
  tags        = module.context.tags
}

module "cdn" {
  source = "../../../../modules/aws/edge/cloudfront"

  name                  = "${module.context.name}-cdn"
  s3_origin_bucket_id   = module.bucket.bucket_id
  s3_origin_bucket_arn  = module.bucket.bucket_arn
  s3_origin_domain_name = module.bucket.bucket_regional_domain_name
  default_root_object   = "index.html"
  tags                  = module.context.tags
}
