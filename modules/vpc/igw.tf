resource "aws_internet_gateway" "audrey_igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.tags, {
    Name = format("%s-%s-igw", var.tags.id, var.tags.owner)
  })
}
