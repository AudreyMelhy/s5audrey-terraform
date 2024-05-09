data "aws_ami" "jenkins_ami" {
  most_recent = true
  filter {
    name   = "tag:Name"
    values = ["jenkins_master_ami-*"]
  }

  filter {
    name   = "tag:environment"
    values = ["dev"]
  }

  filter {
    name   = "tag:resource"
    values = ["jenkins_master"]
  }
}