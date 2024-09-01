resource "aws_eip" "vpc_eip" {
  count  = var.nat_gateway_active ? length(var.public_subnets) : 0
  domain = "vpc"
  tags = {
    Name = format("%s-eip-%s", var.project_name, var.azs[count.index])
  }
  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "nat" {
  count         = var.nat_gateway_active ? length(var.public_subnets) : 0
  allocation_id = aws_eip.vpc_eip[count.index].id
  subnet_id     = aws_subnet.public[count.index].id
  tags = {
    Name = format("%s-nat-%s", var.project_name, var.azs[count.index])
  }
  depends_on = [aws_internet_gateway.this]
}