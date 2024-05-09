resource "aws_security_group" "jenkins_sg" {
  name   = format("%s-%s-jenkins-sg", var.tags["id"], var.tags["environment"])
  vpc_id = data.aws_vpc.audrey_vpc.id
  tags = merge(var.tags, {
    Name = format("jenkins-%s-%s-sg", var.tags["id"], var.tags["environment"])
    },
  )
}

resource "aws_security_group" "bastion_sg" {
  name   = format("%s-%s-bastion-sg", var.tags["id"], var.tags["environment"])
  vpc_id = data.aws_vpc.audrey_vpc.id
  tags = merge(var.tags, {
    Name = format("bastion-%s-%s-sg", var.tags["id"], var.tags["environment"])
    },
  )
}

# resource "aws_security_group" "lb_sg" {
#   name   = format("%s-%s-lb-sg", var.tags["id"], var.tags["environment"])
#   vpc_id = data.aws_vpc.audrey_vpc.id
#   tags = merge(var.tags, {
#     Name = format("lb-%s-%s-sg", var.tags["id"], var.tags["environment"])
#     },
#   )
# }