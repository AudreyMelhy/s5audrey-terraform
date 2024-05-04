data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "replication" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]

    resources = [aws_s3_bucket.source.arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObjectVersionForReplication",
      # "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
    ]

    # actions = [
    #   "s3:GetObjectVersionForReplication",
    #   "s3:GetObjectVersionAcl",
    #   "s3:GetObjectVersionTagging",
    # ]


    resources = ["${aws_s3_bucket.source.arn}/*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete", # to be allowed only for testing purpose
      "s3:ReplicateTags",
    ]

    resources = ["${aws_s3_bucket.destination.arn}/*"]
  }

  # statement {
  #   effect = "Allow"

  #   actions = [
  #     "s3:PutBucketVersioning",
  #     # "s3:PutBucketAcl",
  #   ]

  #   resources = [aws_s3_bucket.source.arn]
  # }

}