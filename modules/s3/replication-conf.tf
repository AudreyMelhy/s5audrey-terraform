resource "aws_s3_bucket_replication_configuration" "replication" {
  role   = aws_iam_role.s3_replication_role.arn
  bucket = aws_s3_bucket.source.id

  rule {
    id     = "StateReplicationAll"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }

  }
}





