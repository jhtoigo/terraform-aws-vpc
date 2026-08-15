locals {
  max_subnet_count = max([
    length(var.public_subnets),
    length(var.private_subnets),
    length(var.database_subnets)
  ]...)
}
