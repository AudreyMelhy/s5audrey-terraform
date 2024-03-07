resource "aws_route_table" "audrey_public_rt" {
  count  = var.nat_gateway_count == 1 ? 1 : length(aws_subnet.audrey_public_subnet)
  vpc_id = aws_vpc.audrey_vpc.id

  tags = merge(var.tags, {
    Name = format("%s-%s-public-rt", var.tags.id, var.tags.owner)
  })
}

resource "aws_route_table_association" "public_subnet_associations" {
  count = length(aws_subnet.audrey_public_subnet)

  subnet_id      = aws_subnet.audrey_public_subnet[count.index].id
  route_table_id = aws_route_table.audrey_public_rt[count.index % length(aws_route_table.audrey_public_rt)].id
}

resource "aws_route_table" "audrey_private_rt" {
  count  = var.nat_gateway_count == 1 ? 1 : length(aws_subnet.audrey_private_subnet)
  vpc_id = aws_vpc.audrey_vpc.id

  tags = merge(var.tags, {
    Name = format("%s-%s-private-rt", var.tags.id, var.tags.owner)
  })
}

resource "aws_route_table_association" "private_subnet_associations" {
  count = length(aws_subnet.audrey_private_subnet)

  subnet_id      = aws_subnet.audrey_private_subnet[count.index].id
  route_table_id = aws_route_table.audrey_private_rt[count.index % length(aws_route_table.audrey_private_rt)].id
}