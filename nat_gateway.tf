resource "aws_eip" "vpc_eip" {
  domain = "vpc"
  tags = {
    Name = format("%s-eip", var.project_name)
  }
  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = format("%s-nat", var.project_name)
  }
  depends_on = [aws_internet_gateway.this]
}