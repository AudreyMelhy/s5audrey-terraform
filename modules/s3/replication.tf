# IAM Role for replication
resource "aws_iam_role" "replication_role" {
  provider           = aws.main
  name               = format("%s-%s-s3-replication-role", var.tags.id, var.tags.owner)
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

}

# IAM Policy for replication
resource "aws_iam_policy" "replication_policy" {
  provider = aws.main
  name     = format("%s-%s-s3-replication-policy", var.tags.id, var.tags.owner)
  policy   = data.aws_iam_policy_document.replication.json

}


# IAM Role Policy Attachment
resource "aws_iam_role_policy_attachment" "replication_role_policy_attachment" {
  provider   = aws.main
  # name       = format("%s-%s-s3-replication-policy_attachment", var.tags.id, var.tags.owner)
  role       = aws_iam_role.replication_role.name
  policy_arn = aws_iam_policy.replication_policy.arn
}

# # Create an IAM role for S3 replication
# resource "aws_iam_role" "s3_replication_role" {
#   provider = aws.main # Use the "main" provider for this resource
#   name     = "s3-replication-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect = "Allow",
#       Principal = {
#         Service = "s3.amazonaws.com"
#       },
#       Action = "sts:AssumeRole"
#     }]
#   })
# }

# # Attach a policy to the IAM role to grant permissions for S3 replication
# resource "aws_iam_policy_attachment" "s3_replication_policy_attachment" {
#   provider   = aws.main # Use the "main" provider for this resource
#   name       = "s3-replication-policy-attachment"
#   roles      = [aws_iam_role.s3_replication_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReplicateDeletes"
# }