resource "aws_nat_gateway" "audrey_nat" {
  count = var.environment == "prod" ? 3 : 1

  # Define local variable to hold the index of the Elastic IP address
  # based on the environment

  allocation_id = var.environment == "prod" ? aws_eip.audrey_eip[count.index % length(aws_eip.audrey_eip)].id : aws_eip.audrey_eip[0].id
  subnet_id     = aws_subnet.audrey_public_subnet[count.index % length(aws_subnet.audrey_public_subnet)].id
  depends_on    = [aws_internet_gateway.audrey_igw]

  tags = merge(var.tags, {
    Name = format("%s-%s-nat", var.tags.id, var.tags.owner)
  })

}