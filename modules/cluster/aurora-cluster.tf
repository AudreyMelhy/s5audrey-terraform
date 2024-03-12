resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier              = var.cluster.identifier
  engine                          = var.cluster.engine
  engine_version                  = var.cluster.engineversion
  database_name                   = var.cluster.dbname
  master_username                 = var.cluster.dbusername
  master_password                 = aws_secretsmanager_secret_version.rds_master_password_version.secret_string # Use the secret value from Secrets Manager
  db_subnet_group_name            = aws_db_subnet_group.s5audrey_subnet_group.name
  vpc_security_group_ids          = [aws_security_group.s5audrey_aurora_security_group.id]
  availability_zones              = var.Av_zones
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.aurora_cluster_parameter_group.name

  skip_final_snapshot     = var.cluster.skip_final_snapshot
  storage_encrypted       = var.cluster.storage_encryption
  backup_retention_period = var.cluster.backup_retention
  preferred_backup_window = var.cluster.backup_window
  deletion_protection     = var.cluster.deletion_protection
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  # scaling_configuration {
  #   min_capacity = 2
  #   max_capacity = 3
  #   auto_pause   = true
  # }

  tags = merge(var.tags, {
    Name = format("aurora-cluster-%s-%s", var.tags["id"], var.tags["owner"])
  })
}