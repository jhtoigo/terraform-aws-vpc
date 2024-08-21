resource "aws_ssm_parameter" "vpc" {
  name  = format("/%s/vpc/vpc_id", var.project_name)
  type  = "String"
  value = aws_vpc.this.id
}

resource "aws_ssm_parameter" "private_subnets" {
  count = length(var.private_subnets)
  name  = format("/%s/vpc/subnet-private-%s", var.project_name, aws_subnet.private[count.index].availability_zone)
  type  = "String"
  value = aws_subnet.private[count.index].id
}

resource "aws_ssm_parameter" "public_subnets" {
  count = length(var.public_subnets)
  name  = format("/%s/vpc/subnet-public-%s", var.project_name, aws_subnet.public[count.index].availability_zone)
  type  = "String"
  value = aws_subnet.public[count.index].id
}

resource "aws_ssm_parameter" "database_subnets" {
  count = length(var.database_subnets)
  name  = format("/%s/vpc/subnet-database-%s", var.project_name, aws_subnet.database[count.index].availability_zone)
  type  = "String"
  value = aws_subnet.database[count.index].id
}