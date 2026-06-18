variable "name" {
  description = "VPC name."
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VPC."
  type        = map(string)
  default     = {}
}

variable "create_vpc" {
  description = "Whether to create the VPC resource. Useful while evolving the scaffold."
  type        = bool
  default     = false
}
