variable "bucket_name" {
  description = "Globally unique S3 bucket name."
  type        = string

  validation {
    condition     = length(trimspace(var.bucket_name)) > 0
    error_message = "bucket_name must not be empty."
  }
}

variable "tags" {
  description = "Tags to apply to the S3 bucket."
  type        = map(string)
  default     = {}
}

variable "force_destroy" {
  description = "Whether to allow Terraform to delete a non-empty bucket."
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Whether S3 object versioning should be enabled."
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm. Supported values are AES256 and aws:kms."
  type        = string
  default     = "AES256"

  validation {
    condition     = contains(["AES256", "aws:kms"], var.sse_algorithm)
    error_message = "sse_algorithm must be either AES256 or aws:kms."
  }
}

variable "kms_key_id" {
  description = "Optional KMS key ID or ARN used when sse_algorithm is aws:kms."
  type        = string
  default     = null
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket."
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket."
  type        = bool
  default     = true
}

variable "website_enabled" {
  description = "Whether to configure the bucket for S3 static website hosting."
  type        = bool
  default     = false
}

variable "website_public_access_enabled" {
  description = "Whether to expose the S3 website publicly with a bucket policy."
  type        = bool
  default     = false
}

variable "website_index_document" {
  description = "Index document name for the S3 website."
  type        = string
  default     = "index.html"
}

variable "website_error_document" {
  description = "Optional error document name for the S3 website."
  type        = string
  default     = "error.html"
}

variable "object_ownership" {
  description = "S3 object ownership mode. Use BucketOwnerEnforced for the most secure default."
  type        = string
  default     = "BucketOwnerEnforced"

  validation {
    condition     = contains(["BucketOwnerEnforced", "BucketOwnerPreferred", "ObjectWriter"], var.object_ownership)
    error_message = "object_ownership must be one of BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter."
  }
}

variable "additional_policy_json" {
  description = "Optional additional bucket policy JSON to merge with module-managed statements."
  type        = string
  default     = null
}

variable "cors_rules" {
  description = "Optional CORS rules for the bucket."
  type = list(object({
    allowed_headers = optional(list(string), [])
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = optional(list(string), [])
    max_age_seconds = optional(number)
  }))
  default = []
}

variable "lifecycle_rules" {
  description = "Optional lifecycle rules for the bucket."
  type = list(object({
    id                                     = string
    enabled                                = optional(bool, true)
    prefix                                 = optional(string)
    abort_incomplete_multipart_upload_days = optional(number)
    expiration_days                        = optional(number)
    noncurrent_version_expiration_days     = optional(number)
  }))
  default = []
}
