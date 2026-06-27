variable "input" {
  description = "A string containing placeholders in the format `{placeholder}`."
  type        = string
}

variable "map" {
  description = "Placeholder values to inject into the input string."
  type        = map(string)
}

variable "make_lowercase" {
  description = "Whether the rendered output should be converted to lowercase."
  type        = bool
  default     = false
}
