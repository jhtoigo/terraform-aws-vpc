resource "aws_eip" "vpc_eip" {
  count  = var.nat_gateway_active ? 1 : 0
  domain = "vpc"
  tags = {
    Name = format("%s-eip", var.project_name)
  }
  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "nat" {
  count         = var.nat_gateway_active ? 1 : 0
  allocation_id = aws_eip.vpc_eip[0].id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = format("%s-nat", var.project_name)
  }
  depends_on = [aws_internet_gateway.this]
}