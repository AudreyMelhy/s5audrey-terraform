resource "aws_iam_role" "replication" {
  provider = aws.source
  name     = format("%s-%s-s3-replication-role", var.tags.id, var.tags.owner)
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "replication" {
  provider = aws.source
  name   = format("%s-%s-S3ReplicationPolicy", var.tags.id, var.tags.owner)
  policy = data.aws_iam_policy_document.replication.json
}

resource "aws_iam_role_policy_attachment" "replication" {
  provider = aws.source
  # name   = format("%s-%s-S3ReplicationPolicyAttachment", var.tags.id, var.tags.owner)
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}

# # IAM Role Policy Attachment
# resource "aws_iam_role_policy_attachment" "s3_replication_policy_attachment" {
#   role       = aws_iam_role.s3_replication.name
#   policy_arn = aws_iam_policy.replication.arn
# }