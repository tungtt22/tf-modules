variable "name" {
  description = "Logical name used in comments and the origin access control."
  type        = string
}

variable "s3_origin_bucket_id" {
  description = "S3 bucket ID used as the CloudFront origin."
  type        = string
}

variable "s3_origin_bucket_arn" {
  description = "S3 bucket ARN used for the origin bucket policy."
  type        = string
}

variable "s3_origin_domain_name" {
  description = "Regional S3 bucket domain name used by CloudFront as the origin domain."
  type        = string
}

variable "enabled" {
  description = "Whether the CloudFront distribution is enabled."
  type        = bool
  default     = true
}

variable "comment" {
  description = "Optional comment for the CloudFront distribution."
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Default root object served by CloudFront."
  type        = string
  default     = "index.html"
}

variable "aliases" {
  description = "Optional alternate domain names (CNAMEs) for the distribution."
  type        = list(string)
  default     = []
}

variable "price_class" {
  description = "CloudFront price class."
  type        = string
  default     = "PriceClass_100"
}

variable "viewer_protocol_policy" {
  description = "Viewer protocol policy for the default cache behavior."
  type        = string
  default     = "redirect-to-https"
}

variable "cache_policy_name" {
  description = "Managed cache policy name used for the default cache behavior."
  type        = string
  default     = "Managed-CachingOptimized"
}

variable "response_headers_policy_name" {
  description = "Optional managed response headers policy name."
  type        = string
  default     = null
}

variable "web_acl_id" {
  description = "Optional AWS WAF web ACL ARN."
  type        = string
  default     = null
}

variable "acm_certificate_arn" {
  description = "Optional ACM certificate ARN in us-east-1 for custom domains."
  type        = string
  default     = null
}

variable "ssl_support_method" {
  description = "SSL support method for custom certificates."
  type        = string
  default     = "sni-only"
}

variable "minimum_protocol_version" {
  description = "Minimum TLS protocol version for viewers."
  type        = string
  default     = "TLSv1.2_2021"
}

variable "manage_origin_bucket_policy" {
  description = "Whether this module should manage the S3 bucket policy needed for CloudFront access."
  type        = bool
  default     = true
}

variable "allowed_methods" {
  description = "Allowed HTTP methods for the default cache behavior."
  type        = list(string)
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "cached_methods" {
  description = "Cached HTTP methods for the default cache behavior."
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "custom_error_responses" {
  description = "Optional custom error responses for single-page apps or custom error pages."
  type = list(object({
    error_code            = number
    response_code         = optional(number)
    response_page_path    = optional(string)
    error_caching_min_ttl = optional(number)
  }))
  default = []
}

variable "geo_restriction_type" {
  description = "Geo restriction type. Use none, whitelist, or blacklist."
  type        = string
  default     = "none"
}

variable "geo_restriction_locations" {
  description = "Country codes used when geo restriction is whitelist or blacklist."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the CloudFront distribution and OAC."
  type        = map(string)
  default     = {}
}
