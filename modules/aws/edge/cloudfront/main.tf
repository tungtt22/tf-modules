locals {
  custom_certificate_enabled = length(var.aliases) > 0 || var.acm_certificate_arn != null
}

data "aws_cloudfront_cache_policy" "default" {
  name = var.cache_policy_name
}

data "aws_cloudfront_response_headers_policy" "default" {
  count = var.response_headers_policy_name == null ? 0 : 1
  name  = var.response_headers_policy_name
}

data "aws_iam_policy_document" "origin_bucket_policy" {
  count = var.manage_origin_bucket_policy ? 1 : 0

  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${var.s3_origin_bucket_arn}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.this.arn]
    }
  }
}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = var.name
  description                       = "Origin access control for ${var.name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "this" {
  enabled             = var.enabled
  comment             = var.comment
  default_root_object = var.default_root_object
  aliases             = var.aliases
  price_class         = var.price_class
  web_acl_id          = var.web_acl_id

  origin {
    domain_name              = var.s3_origin_domain_name
    origin_id                = var.s3_origin_bucket_id
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }

  default_cache_behavior {
    allowed_methods            = var.allowed_methods
    cached_methods             = var.cached_methods
    cache_policy_id            = data.aws_cloudfront_cache_policy.default.id
    compress                   = true
    response_headers_policy_id = try(data.aws_cloudfront_response_headers_policy.default[0].id, null)
    target_origin_id           = var.s3_origin_bucket_id
    viewer_protocol_policy     = var.viewer_protocol_policy
  }

  restrictions {
    geo_restriction {
      restriction_type = var.geo_restriction_type
      locations        = var.geo_restriction_locations
    }
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_responses

    content {
      error_code            = custom_error_response.value.error_code
      response_code         = try(custom_error_response.value.response_code, null)
      response_page_path    = try(custom_error_response.value.response_page_path, null)
      error_caching_min_ttl = try(custom_error_response.value.error_caching_min_ttl, null)
    }
  }

  viewer_certificate {
    acm_certificate_arn            = local.custom_certificate_enabled ? var.acm_certificate_arn : null
    cloudfront_default_certificate = local.custom_certificate_enabled ? false : true
    minimum_protocol_version       = local.custom_certificate_enabled ? var.minimum_protocol_version : "TLSv1"
    ssl_support_method             = local.custom_certificate_enabled ? var.ssl_support_method : null
  }

  tags = var.tags

  lifecycle {
    precondition {
      condition     = !local.custom_certificate_enabled || (var.acm_certificate_arn != null && trimspace(var.acm_certificate_arn) != "")
      error_message = "acm_certificate_arn must be provided when aliases are configured."
    }
  }
}

resource "aws_s3_bucket_policy" "origin_access" {
  count = var.manage_origin_bucket_policy ? 1 : 0

  bucket = var.s3_origin_bucket_id
  policy = data.aws_iam_policy_document.origin_bucket_policy[0].json
}
