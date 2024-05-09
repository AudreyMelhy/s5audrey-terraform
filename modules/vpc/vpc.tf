resource "aws_vpc" "audrey_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = var.vpc_options["instance_tenancy"]
  enable_dns_support   = var.vpc_options["enable_dns_hostnames"]
  enable_dns_hostnames = var.vpc_options["enable_dns_support"]

  tags = merge(var.tags, {
    Name = format("%s-%s-vpc", var.tags.id, var.tags.owner)
  })
}