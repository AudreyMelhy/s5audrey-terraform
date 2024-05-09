# resource "aws_route_table_association" "audrey_public_rt_associate" {
#   count          = length(var.availability_zones)
#   subnet_id      = element(aws_subnet.audrey_public_subnet.*.id, count.index)
#   route_table_id = aws_route_table.audrey_public_rt.id
# }

# resource "aws_route_table_association" "audrey_private_rt_associate" {
#   count          = length(var.availability_zones)
#   subnet_id      = element(aws_subnet.audrey_private_subnet.*.id, count.index)
#   route_table_id = element(aws_route_table.audrey_private_rt.*.id, count.index)
# }