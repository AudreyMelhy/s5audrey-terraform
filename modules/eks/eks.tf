
resource "aws_eks_cluster" "s5audrey_cluster" {
  name     = format("%s-%s-cluster", var.tags.id, var.tags.owner)
  role_arn = aws_iam_role.s5audrey_role.arn

  vpc_config {
    # subnet_ids = [for az in var.AZs : az if az != "us-east-1e"]
    subnet_ids = var.public_subnets
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.s5audrey_policy_1-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.s5audrey_policy_2-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.s5audrey_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.s5audrey_cluster.certificate_authority[0].data
}