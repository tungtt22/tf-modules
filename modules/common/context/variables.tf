variable "namespace" {
  description = "Top-level organization or business namespace."
  type        = string

  validation {
    condition     = length(trimspace(var.namespace)) > 0
    error_message = "namespace must not be empty."
  }
}

variable "environment" {
  description = "Deployment environment such as dev, staging, or prod."
  type        = string

  validation {
    condition     = length(trimspace(var.environment)) > 0
    error_message = "environment must not be empty."
  }
}

variable "application" {
  description = "Application or workload name."
  type        = string

  validation {
    condition     = length(trimspace(var.application)) > 0
    error_message = "application must not be empty."
  }
}

variable "owner" {
  description = "Owning team or individual."
  type        = string
  default     = "platform"
}

variable "attributes" {
  description = "Optional extra name components."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Additional tags or labels to merge into the generated metadata."
  type        = map(string)
  default     = {}
}
