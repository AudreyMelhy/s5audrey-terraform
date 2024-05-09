data "aws_vpc" "audrey_vpc" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc"]
  }
  filter {
    name   = "tag:environment"
    values = ["dev"]
  }
  filter {
    name   = "tag:id"
    values = ["001"]
  }
}