data "aws_subnet" "bastion_sub_pub" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc-public-subnet-1"]
  }
}