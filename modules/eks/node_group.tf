locals {
  dev_desired_size = 3
  prod_desired_size = length(aws_eks_cluster.s5audrey_cluster.vpc_config[0].subnet_ids)
}

# resource "aws_eks_node_group" "s5audrey" {
#   for_each = var.environment == "dev" ? { "dev" = "dev-node-group" } : { for idx, az in var.AZs : idx => format("prod-node-group-%s", az) if az != "us-east-1e" }

#   cluster_name    = aws_eks_cluster.s5audrey_cluster.name
#   node_group_name = each.value
# #   node_group_name = var.environment == "dev" ? "dev-node-group" : format("prod-node-group-%s", each.key)

#   node_role_arn = aws_iam_role.s5audrey_node_role.arn

#   subnet_ids = [each.value]

#   scaling_config {
#     min_size = var.environment == "dev" ? 1 : 1
#     max_size = var.environment == "dev" ? 3 : 10
#     desired_size = var.environment == "dev" ? 1 : 5
#   }

# }

resource "aws_launch_configuration" "worker_nodes" {
  count = var.environment == "dev" ? 3 : length([for az in var.AZs : az if az != "us-east-1e"])  # Exclude us-east-1e
  image_id       = var.image_id
  instance_type  = var.instance_type
  # Configuration for worker nodes
}

resource "aws_autoscaling_group" "worker_nodes" {
  count                = var.environment == "dev" ? 3 : length([for az in var.AZs : az if az != "us-east-1e"])
  name                 = format("%s-%s-worker-node-%d", var.tags.id, var.tags.owner, count.index+1)
  launch_configuration = aws_launch_configuration.worker_nodes[count.index].id
  min_size             = var.environment == "dev" ? 1 : 1
  max_size             = var.environment == "dev" ? 3 : 5
  desired_capacity     = var.environment == "dev" ? 1 : 2
  vpc_zone_identifier  = [element([for az in var.AZs : az if az != "us-east-1e"], count.index)]  # Exclude us-east-1e
}

