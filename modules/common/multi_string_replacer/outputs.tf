output "value" {
  description = "Rendered string after placeholder replacement."
  value       = var.make_lowercase ? lower(local.rendered_value) : local.rendered_value
}
