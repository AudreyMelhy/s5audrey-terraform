data "aws_security_group" "jenkins_sg" {
  filter {
    name   = "tag:Name"
    values = ["bastion-001-dev-sg"]
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

data "aws_security_group" "lb_sg" {
  filter {
    name   = "tag:Name"
    values = ["lb-001-dev-sg"]
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