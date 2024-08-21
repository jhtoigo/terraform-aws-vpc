resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnets[count.index]
  availability_zone = var.azs[count.index]
  tags = merge(
    {
      Name = format("subnet-public-%s", var.azs[count.index])
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
      Name = format("subnet-private-%s", var.azs[count.index])
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
      Name = format("subnet-database-%s", var.azs[count.index])
    },
    var.tags
  )
}