resource "aws_security_group" "s5audrey_aurora_security_group" {
  name   = "s5audrey_rds_security_group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.ing_from_port
    to_port     = var.ing_to_port
    protocol    = var.ing_prot
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = var.eg_from_port
    to_port     = var.eg_to_port
    protocol    = var.eg_prot
    cidr_blocks = var.cidr_blocks
  }

  tags = merge(var.tags, {
    Name = format("aurora-db-sg-%s-%s", var.tags["id"], var.tags["owner"])
  })

}