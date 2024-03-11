resource "aws_rds_cluster_parameter_group" "aurora_cluster_parameter_group" {
  name        = var.param_grp.name
  family      = var.param_grp.family
  description = var.param_grp.description
}