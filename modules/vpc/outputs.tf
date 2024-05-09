output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.audrey_vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = aws_subnet.audrey_public_subnet[*].id
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = aws_subnet.audrey_private_subnet[*].id
}

# output "nat_gateway_ids" {
#   description = "IDs of the created NAT gateways"
#   value       = aws_nat_gateway.audrey_nat[*].id
# }


# output "nat_gateway_allocation_ids" {
#   description = "Allocation IDs of the created NAT gateways"
#   value       = aws_nat_gateway.audrey_nat[*].allocation_id
# }

output "igw_ids" {
  description = "IDs of the created internet gateway"
  value       = aws_internet_gateway.audrey_igw[*].id
}

# output "aws_private_route_table" {
#   description = "IDs of the created internet gateway"
#   value       = aws_route_table.audrey_private_rt[*].id
# }

# output "aws_public_route_table" {
#   description = "IDs of the created internet gateway"
#   value       = aws_route_table.audrey_public_rt[*].id
# }

# output "aws_eip" {
#   description = "IDs of the created elastic IP"
#   value       = aws_eip.audrey_eip[*].id
# }