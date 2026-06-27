locals {
  use_kms_encryption            = var.sse_algorithm == "aws:kms"
  website_public_policy_enabled = var.website_enabled && var.website_public_access_enabled
  effective_block_public_policy = local.website_public_policy_enabled ? false : var.block_public_policy
  effective_restrict_public     = local.website_public_policy_enabled ? false : var.restrict_public_buckets
  policy_documents = compact([
    local.website_public_policy_enabled ? data.aws_iam_policy_document.website_public_read[0].json : null,
    var.additional_policy_json,
  ])
  bucket_policy_enabled = length(local.policy_documents) > 0
}

data "aws_iam_policy_document" "website_public_read" {
  count = local.website_public_policy_enabled ? 1 : 0

  statement {
    sid    = "AllowPublicReadForWebsite"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${aws_s3_bucket.this.arn}/*",
    ]
  }
}

data "aws_iam_policy_document" "combined" {
  count = local.bucket_policy_enabled ? 1 : 0

  source_policy_documents = local.policy_documents
}

resource "aws_s3_bucket" "this" {
  bucket        = var.bucket_name
  force_destroy = var.force_destroy
  tags          = var.tags
}

resource "aws_s3_bucket_ownership_controls" "this" {
  bucket = aws_s3_bucket.this.id

  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id

  lifecycle {
    precondition {
      condition     = !local.use_kms_encryption || (var.kms_key_id != null && trimspace(var.kms_key_id) != "")
      error_message = "kms_key_id must be provided when sse_algorithm is aws:kms."
    }
  }

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
      kms_master_key_id = local.use_kms_encryption ? var.kms_key_id : null
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  lifecycle {
    precondition {
      condition     = !var.website_public_access_enabled || var.website_enabled
      error_message = "website_enabled must be true when website_public_access_enabled is true."
    }
  }

  block_public_acls       = var.block_public_acls
  block_public_policy     = local.effective_block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = local.effective_restrict_public
}

resource "aws_s3_bucket_cors_configuration" "this" {
  count = length(var.cors_rules) > 0 ? 1 : 0

  bucket = aws_s3_bucket.this.id

  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      allowed_headers = try(cors_rule.value.allowed_headers, [])
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      expose_headers  = try(cors_rule.value.expose_headers, [])
      max_age_seconds = try(cors_rule.value.max_age_seconds, null)
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count = length(var.lifecycle_rules) > 0 ? 1 : 0

  bucket = aws_s3_bucket.this.id

  dynamic "rule" {
    for_each = var.lifecycle_rules

    content {
      id     = rule.value.id
      status = try(rule.value.enabled, true) ? "Enabled" : "Disabled"

      filter {
        prefix = try(rule.value.prefix, "")
      }

      dynamic "abort_incomplete_multipart_upload" {
        for_each = try(rule.value.abort_incomplete_multipart_upload_days, null) == null ? [] : [rule.value.abort_incomplete_multipart_upload_days]

        content {
          days_after_initiation = abort_incomplete_multipart_upload.value
        }
      }

      dynamic "expiration" {
        for_each = try(rule.value.expiration_days, null) == null ? [] : [rule.value.expiration_days]

        content {
          days = expiration.value
        }
      }

      dynamic "noncurrent_version_expiration" {
        for_each = try(rule.value.noncurrent_version_expiration_days, null) == null ? [] : [rule.value.noncurrent_version_expiration_days]

        content {
          noncurrent_days = noncurrent_version_expiration.value
        }
      }
    }
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  count = var.website_enabled ? 1 : 0

  bucket = aws_s3_bucket.this.id

  index_document {
    suffix = var.website_index_document
  }

  dynamic "error_document" {
    for_each = var.website_error_document == null ? [] : [var.website_error_document]

    content {
      key = error_document.value
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count = local.bucket_policy_enabled ? 1 : 0

  bucket = aws_s3_bucket.this.id
  policy = data.aws_iam_policy_document.combined[0].json
}
