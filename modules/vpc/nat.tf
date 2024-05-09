# resource "aws_nat_gateway" "audrey_nat" {
#   count = var.tags.environment == "prod" ? length(var.availability_zones) : var.nat_gateway_count

#   # Define local variable to hold the index of the Elastic IP address
#   # based on the environment

#   allocation_id = var.tags.environment == "prod" ? aws_eip.audrey_eip[count.index % length(aws_eip.audrey_eip)].id : aws_eip.audrey_eip[0].id
#   subnet_id     = element(aws_subnet.audrey_public_subnet.*.id, count.index)

#   tags = merge(var.tags, {
#     Name = format("%s-%s-nat-${count.index + 1}", var.tags.id, var.tags.owner)
#   })

# }