resource "aws_eip" "audrey_eip" {
  count      = var.environment == "prod" ? 3 : 1
  vpc        = true
  depends_on = [aws_internet_gateway.audrey_igw]

  tags = merge(var.tags, {
    Name = format("%s-%s--ElasticIPAddress-%d", var.tags.id, var.tags.owner, count.index + 1)
  })
}
