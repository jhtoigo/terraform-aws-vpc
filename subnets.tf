resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    {
      Name = format("%s-public-%s", var.project_name, var.azs[count.index])
    },
    var.tags
  )
}

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    {
      Name = format("%s-private-%s", var.project_name, var.azs[count.index])
    },
    var.tags
  )
}

resource "aws_subnet" "database" {
  count             = length(var.database_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.database_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    {
      Name = format("%s-database-%s", var.project_name, var.azs[count.index])
    },
    var.tags
  )
}

resource "aws_db_subnet_group" "database" {
  count = length(var.database_subnets) > 0 ? 1 : 0

  name        = var.project_name
  description = "Database subnet group for ${var.project_name}"
  subnet_ids  = aws_subnet.database[*].id

  tags = merge(
    {
      "Name" = var.project_name
    },
    var.tags
  )
}