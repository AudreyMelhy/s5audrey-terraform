resource "aws_subnet" "audrey_public_subnet" {
  count = length(var.availability_zones)

  vpc_id                  = aws_vpc.audrey_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.audrey_vpc.cidr_block, 8, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = merge(var.tags, {
    Name                                        = format("%s-%s-${var.vpc_name}-public-subnet-${count.index + 1}", var.tags.id, var.tags.owner)
    tier                                        = "public"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  })
  depends_on = [aws_internet_gateway.audrey_igw]


}

resource "aws_subnet" "audrey_private_subnet" {
  count      = length(var.availability_zones)
  vpc_id     = aws_vpc.audrey_vpc.id
  cidr_block = cidrsubnet(aws_vpc.audrey_vpc.cidr_block, 8, count.index + 4)
  # cidr_block        = cidrsubnet(aws_vpc.audrey_vpc.cidr_block, 8, count.index + length(var.availability_zones))
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.tags, {
    Name                                        = format("%s-%s-${var.vpc_name}-private-subnet-${count.index + 1}", var.tags.id, var.tags.owner)
    tier                                        = "private"
    "kubernetes.io/role/elb"                    = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  })
}
