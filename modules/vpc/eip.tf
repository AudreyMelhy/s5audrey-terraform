# resource "aws_eip" "audrey_eip" {
#   count      = var.tags.environment == "prod" ? length(var.availability_zones) : var.nat_gateway_count
#   vpc        = true
#   depends_on = [aws_internet_gateway.audrey_igw]

#   tags = merge(var.tags, {
#     Name = format("%s-%s-ElasticIPAddress-${element(var.availability_zones, count.index)}", var.tags.id, var.tags.owner)
#   })
# }
