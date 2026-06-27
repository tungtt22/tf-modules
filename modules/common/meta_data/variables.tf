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

variable "owner" {
  description = "Owner override."
  type        = string
  default     = null
}

variable "attributes" {
  description = "Optional extra name components."
  type        = list(string)
  default     = []
}

variable "prefix" {
  description = "Optional prefix component added before all other name parts."
  type        = string
  default     = null
}

variable "name" {
  description = "Optional resource-specific name component."
  type        = string
  default     = null
}

variable "resource_type" {
  description = "Optional generic resource type suffix."
  type        = string
  default     = null
}

variable "suffix" {
  description = "Optional suffix component appended after the resource type."
  type        = string
  default     = null
}

variable "extra_name_parts" {
  description = "Additional name parts to append after the shared context."
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

variable "managed_by" {
  description = "Metadata field identifying the provisioning system."
  type        = string
  default     = "terraform"
}

variable "workload" {
  description = "Optional workload or service grouping."
  type        = string
  default     = null
}

variable "cost_center" {
  description = "Optional cost center identifier."
  type        = string
  default     = null
}

variable "business_unit" {
  description = "Optional business unit identifier."
  type        = string
  default     = null
}

variable "data_classification" {
  description = "Optional data classification such as public, internal, or confidential."
  type        = string
  default     = null
}

variable "compliance_domain" {
  description = "Optional compliance domain such as pci or hipaa."
  type        = string
  default     = null
}

variable "additional_metadata" {
  description = "Additional normalized metadata fields to merge into the output."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Additional tags to merge into the metadata output."
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Additional labels to merge into the metadata output."
  type        = map(string)
  default     = {}
}
