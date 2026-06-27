variable "context" {
  description = "Optional context object from `common/context`."
  type        = any
  default     = null
}

variable "namespace" {
  description = "Top-level namespace override."
  type        = string
  default     = null
}

variable "environment" {
  description = "Environment override."
  type        = string
  default     = null
}

variable "application" {
  description = "Application override."
  type        = string
  default     = null
}

variable "attributes" {
  description = "Optional extra name components."
  type        = list(string)
  default     = []
}

variable "prefix" {
  description = "Optional prefix component added before all other parts."
  type        = string
  default     = null
}

variable "name" {
  description = "Optional resource-specific name component."
  type        = string
  default     = null
}

variable "resource_type" {
  description = "Optional generic resource type suffix such as `vpc`, `vnet`, or `bucket`."
  type        = string
  default     = null
}

variable "suffix" {
  description = "Optional suffix component appended after the resource type."
  type        = string
  default     = null
}

variable "extra_parts" {
  description = "Additional name parts to append after shared context."
  type        = list(string)
  default     = []
}

variable "delimiter" {
  description = "Delimiter used when joining name parts."
  type        = string
  default     = "-"
}

variable "lowercase" {
  description = "Whether the final rendered name should be lowercase."
  type        = bool
  default     = true
}

variable "max_length" {
  description = "Optional maximum length for the rendered name."
  type        = number
  default     = null
}
