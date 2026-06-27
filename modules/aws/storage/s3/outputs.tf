output "bucket_id" {
  description = "S3 bucket name."
  value       = aws_s3_bucket.this.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket."
  value       = aws_s3_bucket.this.arn
}

output "bucket_domain_name" {
  description = "Bucket domain name."
  value       = aws_s3_bucket.this.bucket_domain_name
}

output "bucket_regional_domain_name" {
  description = "Regional bucket domain name."
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

output "bucket_hosted_zone_id" {
  description = "Hosted zone ID of the S3 bucket."
  value       = aws_s3_bucket.this.hosted_zone_id
}

output "website_endpoint" {
  description = "S3 static website endpoint, if website hosting is enabled."
  value       = try(aws_s3_bucket_website_configuration.this[0].website_endpoint, null)
}

output "website_domain" {
  description = "S3 static website domain, if website hosting is enabled."
  value       = try(aws_s3_bucket_website_configuration.this[0].website_domain, null)
}

output "bucket_policy_json" {
  description = "Final merged bucket policy JSON, if a policy was created."
  value       = try(data.aws_iam_policy_document.combined[0].json, null)
}
