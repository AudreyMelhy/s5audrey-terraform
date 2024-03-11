resource "aws_db_subnet_group" "s5audrey_subnet_group" {
  name       = "s5audrey-rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = merge(var.tags, {
    Name = format("rds-subnet-group-%s-%s", var.tags["id"], var.tags["owner"])
  })

}