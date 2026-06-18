output "vpc_id" {
  description = "ID of the created VPC."
  value       = try(aws_vpc.this[0].id, null)
}

output "name" {
  description = "VPC name."
  value       = var.name
}
