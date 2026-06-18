variable "name" {
  description = "VPC network name."
  type        = string
}

variable "project_id" {
  description = "GCP project ID."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Whether subnetworks should be created automatically."
  type        = bool
  default     = false
}

variable "create_network" {
  description = "Whether to create the network resource."
  type        = bool
  default     = false
}
