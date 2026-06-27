# aws/storage/s3

Reusable AWS S3 bucket module with secure defaults for versioning, server-side encryption, and public access blocking.

## Current Scope

- creates one S3 bucket
- enables versioning by default
- configures server-side encryption
- blocks public access by default
- supports optional KMS encryption and force destroy
- supports optional S3 static website hosting

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
- website hosting is disabled by default

## Website Hosting Notes

- S3 website hosting is HTTP-only; use CloudFront in front of the bucket if you need HTTPS on a custom domain
- when `website_public_access_enabled = true`, the module automatically relaxes the public policy block settings required for public website reads
- objects still need to exist in the bucket, for example `index.html`

## Next Recommended Enhancements

- lifecycle rules
- access logging
- event notifications
- replication
