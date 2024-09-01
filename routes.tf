## Public Routes

resource "aws_route_table" "public_internet_access" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = format("%s-public", var.project_name)
  }
}

resource "aws_route" "public_access" {
  route_table_id         = aws_route_table.public_internet_access.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public_subnets_routes" {
  count          = max(length(var.public_subnets))
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_internet_access.id
}

## Private Routes

resource "aws_route" "private_internet_access" {
  count                  = var.nat_gateway_active ? 1 : 0
  route_table_id         = aws_route_table.private_internet_access_subnets.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[0].id
}

resource "aws_route_table" "private_internet_access_subnets" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = format("%s-private-subs", var.project_name)
  }
}

resource "aws_route_table_association" "private_subnet_routes" {
  count          = max(length(var.private_subnets))
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_internet_access_subnets.id
}
