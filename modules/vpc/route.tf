# resource "aws_route_table" "audrey_public_rt" {
#   vpc_id = aws_vpc.audrey_vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.audrey_igw.id
#   }

#   tags = merge(var.tags, {
#     Name = format("%s-%s-public-route", var.tags.id, var.tags.owner)
#   })
# }

# resource "aws_route_table_association" "public_subnet_associations" {
#   count          = length(var.availability_zones)
#   subnet_id      = element(aws_subnet.audrey_public_subnet.*.id, count.index)
#   route_table_id = aws_route_table.audrey_public_rt.id
# }

# resource "aws_route_table" "audrey_private_rt" {
#   vpc_id = aws_vpc.audrey_vpc.id
#   # count = var.nat_gateway_count
#   count = length(var.availability_zones)

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = element(aws_nat_gateway.audrey_nat[*].id, count.index)
#   }

#   tags = merge(var.tags, {
#     Name = format("%s-%s-private-rt-${var.availability_zones[count.index]}", var.tags.id, var.tags.owner)
#   })
# }

# resource "aws_route_table_association" "private_subnet_associations" {
#   count          = length(var.availability_zones)
#   subnet_id      = element(aws_subnet.audrey_private_subnet[*].id, count.index)
#   route_table_id = element(aws_route_table.audrey_private_rt.*.id, count.index)

# }

