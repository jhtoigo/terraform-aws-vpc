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

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "Public Subnets IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Private Subnets IDs"
  value       = aws_subnet.private[*].id
}
output "database_subnets" {
  description = "Database Subnets IDs"
  value       = aws_subnet.database[*].id
}

output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = compact(aws_subnet.public[*].cidr_block)
}

output "private_subnets_cidr_blocks" {
  description = "List of cidr_blocks of private subnets"
  value       = compact(aws_subnet.private[*].cidr_block)
}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = compact(aws_subnet.database[*].cidr_block)
}

output "private_route_table_ids" {
  value = aws_route_table.private_internet_access_subnets[*].id

}