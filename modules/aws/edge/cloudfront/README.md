# aws/edge/cloudfront

Reusable CloudFront distribution module for S3 origins with Origin Access Control and optional bucket policy management.

## Current Scope

- creates a CloudFront distribution for an S3 origin
- creates an Origin Access Control
- can manage the S3 bucket policy needed for private origin access
- supports custom domains, ACM certificates, WAF, and custom error responses

## Usage

```hcl
module "cdn" {
  source = "../../../../modules/aws/edge/cloudfront"

  name                  = "acme-dev-platform-site"
  s3_origin_bucket_id   = module.bucket.bucket_id
  s3_origin_bucket_arn  = module.bucket.bucket_arn
  s3_origin_domain_name = module.bucket.bucket_regional_domain_name
  tags                  = module.context.tags
}
```

## Notes

- this module is intended for private S3 origins, not S3 website endpoints
- for custom domains, the ACM certificate must exist in `us-east-1`
- for single-page apps, use `custom_error_responses` to map `403` or `404` to `/index.html`
