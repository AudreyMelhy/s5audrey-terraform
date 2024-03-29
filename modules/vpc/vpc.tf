resource "aws_vpc" "audrey_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.tags, {
    Name = format("%s-%s-vpc", var.tags.id, var.tags.owner)
  })
}