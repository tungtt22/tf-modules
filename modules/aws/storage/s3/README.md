# aws/storage/s3

Reusable AWS S3 bucket module with secure defaults for versioning, server-side encryption, and public access blocking.

## Current Scope

- creates one S3 bucket
- enables versioning by default
- configures server-side encryption
- blocks public access by default
- supports optional KMS encryption and force destroy
- supports optional S3 static website hosting
- supports optional CORS, lifecycle rules, and additional bucket policy statements

## Usage

```hcl
module "bucket" {
  source = "../../../../modules/aws/storage/s3"

  bucket_name        = "acme-dev-platform-artifacts"
  versioning_enabled = true
  tags = {
    environment = "dev"
  }
}
```

## Static Website Usage

```hcl
module "website_bucket" {
  source = "../../../../modules/aws/storage/s3"

  bucket_name                   = "acme-dev-platform-site-demo"
  website_enabled               = true
  website_public_access_enabled = true
  website_index_document        = "index.html"
  website_error_document        = "404.html"
}
```

## Security Defaults

- public access block is enabled by default
- server-side encryption is enabled by default using `AES256`
- versioning is enabled by default
- object ownership defaults to `BucketOwnerEnforced`
- website hosting is disabled by default

## Website Hosting Notes

- S3 website hosting is HTTP-only; use CloudFront in front of the bucket if you need HTTPS on a custom domain
- when `website_public_access_enabled = true`, the module automatically relaxes the public policy block settings required for public website reads
- objects still need to exist in the bucket, for example `index.html`

## CloudFront Readiness

This module is ready to work with a separate CloudFront module later:

- the bucket stays private by default
- `bucket_regional_domain_name` is exposed for S3 origin usage
- `additional_policy_json` can merge in extra statements when needed
- `BucketOwnerEnforced` is enabled by default, which fits modern S3 usage well

## Next Recommended Enhancements

- access logging
- event notifications
- replication
