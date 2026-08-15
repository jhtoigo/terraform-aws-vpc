resource "aws_vpc_endpoint" "ecr_api" {
  count               = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id              = aws_vpc.this.id
  service_name        = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = var.enable_dns_support && var.enable_dns_hostnames

  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_vpc.this.default_security_group_id]

  tags = {
    Name = format("%s-ecr-api", var.project_name)
  }
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  count               = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id              = aws_vpc.this.id
  service_name        = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = var.enable_dns_support && var.enable_dns_hostnames

  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_vpc.this.default_security_group_id]

  tags = {
    Name = format("%s-ecr-dkr", var.project_name)
  }
}

resource "aws_vpc_endpoint" "s3" {
  count             = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = aws_route_table.private_internet_access_subnets[*].id

  tags = {
    Name = format("%s-s3", var.project_name)
  }
}
