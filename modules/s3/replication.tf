resource "aws_iam_role" "s3_replication_role" {
  provider = aws.source
  name     = format("%s-%s-s3-replication-role", var.tags.id, var.tags.owner)

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "s3.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "s3_private_acl_policy" {
  provider    = aws.source
  name        = format("%s-%s-S3PrivateAclPolicy", var.tags.id, var.tags.owner)
  description = "Policy for setting S3 bucket ACL to private"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Deny",
        Action   = "s3:PutBucketAcl",
        Resource = aws_s3_bucket.source.arn,
        # Principal = "*",
      },
      {
        Effect = "Allow",
        Action = [
          "s3:GetReplicationConfiguration",
          "s3:ListBucket",
          "s3:GetObjectVersion",
          "s3:GetObjectVersionTagging",
          "s3:ReplicateObject",
          "s3:ReplicateDelete",
          "s3:ReplicateTags",
          "s3:GetBucketAcl",
        ],
        Resource = [
          aws_s3_bucket.source.arn,
          "${aws_s3_bucket.source.arn}/*",
        ],
      },
    ]
  })
}


# resource "aws_iam_policy" "s3_replication_policy" {
#   provider    = aws.source
#   name        = format("%s-%s-S3ReplicationPolicy", var.tags.id, var.tags.owner)
#   description = "Policy for S3 replication"

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:GetReplicationConfiguration",
#           "s3:ListBucket",
#           "s3:GetBucketAcl",
#           "s3:PutBucketAcl"

#         ],
#         Resource = aws_s3_bucket.source.arn
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:GetObjectVersion",
#           # "s3:GetObjectVersionAcl",
#           "s3:GetObjectVersionTagging"
#         ],
#         Resource = "${aws_s3_bucket.source.arn}/*"
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:ReplicateObject",
#           "s3:ReplicateDelete",
#           "s3:ReplicateTags"
#         ],
#         Resource = "${aws_s3_bucket.destination.arn}/*"
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "s3:GetBucketAcl",
#           "s3:PutBucketAcl"
#         ],
#         Resource = aws_s3_bucket.source.arn
#       }

#     ]
#   })
# }

resource "aws_iam_role_policy_attachment" "s3_replication_policy_attachment" {
  provider   = aws.source
  role       = aws_iam_role.s3_replication_role.name
  policy_arn = aws_iam_policy.s3_private_acl_policy.arn
}


