resource "aws_rds_cluster_instance" "aurora_instance" {
  count                = var.instance.count
  cluster_identifier   = aws_rds_cluster.aurora_cluster.id
  instance_class       = var.instance.class
  engine               = var.cluster.engine
  engine_version       = var.cluster.engineversion
  publicly_accessible  = var.instance.accessibility
  db_subnet_group_name = aws_db_subnet_group.s5audrey_subnet_group.name
  identifier           = "artifactory-${count.index + 1}"
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = {
    Name = "artifactory-${count.index + 1}"
  }
}