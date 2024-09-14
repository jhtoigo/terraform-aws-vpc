resource "aws_vpc_endpoint" "ecr_api" {
  count             = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${var.region}.ecr.api"
  vpc_endpoint_type = "Interface"

  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_vpc.this.default_security_group_id]
}

resource "aws_vpc_endpoint" "ecr_dkr" {
  count             = length(var.private_subnets) > 0 ? 1 : 0
  vpc_id            = aws_vpc.this.id
  service_name      = "com.amazonaws.${var.region}.ecr.dkr"
  vpc_endpoint_type = "Interface"

  subnet_ids         = aws_subnet.private[*].id
  security_group_ids = [aws_vpc.this.default_security_group_id]
}