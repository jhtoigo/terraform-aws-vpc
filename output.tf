output "ssm_vpc_id" {
  description = "SSM Parameter ID to VPC ID"
  value       = aws_ssm_parameter.vpc.id
}

output "ssm_public_subnets_id" {
  description = "SSM Parameter IDs to public subnets IDs"
  value       = aws_ssm_parameter.public_subnets[*].id
}

output "ssm_private_subnets_id" {
  description = "SSM Parameter IDs to private subnets IDs"
  value       = aws_ssm_parameter.private_subnets[*].id
}

output "ssm_database_subnets_id" {
  description = "SSM parameter IDs to database subnets IDs"
  value       = aws_ssm_parameter.database_subnets[*].id
}