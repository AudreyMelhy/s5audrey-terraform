resource "aws_subnet" "audrey_public_subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.audrey_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.audrey_vpc.cidr_block, 4, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name = format("%s-%s-public-subnet-%d", var.tags.id, var.tags.owner, count.index)
  })

  depends_on = [aws_internet_gateway.audrey_igw]
}

resource "aws_subnet" "audrey_private_subnet" {
  count = length(var.availability_zones)

  vpc_id            = aws_vpc.audrey_vpc.id
  cidr_block        = cidrsubnet(aws_vpc.audrey_vpc.cidr_block, 4, 10 + count.index)
  availability_zone = var.availability_zones[count.index]
  tags = merge(var.tags, {
    Name = format("%s-%s-private-subnet-%d", var.tags.id, var.tags.owner, count.index)
  })
}