resource "aws_subnet" "audrey_public_subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name                     = format("%s-%s-${var.vpc_name}-public-subnet-${count.index + 1}", var.tags.id, var.tags.owner)
    "kubernetes.io/role/elb" = "1"
  })
  depends_on = [aws_internet_gateway.audrey_igw]


}

resource "aws_subnet" "audrey_private_subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(aws_vpc.vpc.cidr_block, 8, count.index + 4)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.tags, {
    Name = format("%s-%s-${var.vpc_name}-private-subnet-${count.index + 1}", var.tags.id, var.tags.owner)
  })
}
