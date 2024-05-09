data "aws_subnet" "sub_pub" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc-public-subnet-1"]
  }
}


data "aws_subnet" "sub_pub01" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc-public-subnet-2"]
  }
}

data "aws_subnet" "sub_pri" {
  filter {
    name   = "tag:Name"
    values = ["001-AudreyMelhy-vpc-private-subnet-1"]
  }
}