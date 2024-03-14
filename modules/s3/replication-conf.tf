resource "aws_s3_bucket_replication_configuration" "source_to_destination" {
  provider = aws.source
  # # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.source]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.source.id

  rule {
    id = "S3Replication"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.destination.arn
      storage_class = "STANDARD"
    }
  }
}


resource "aws_s3_bucket_replication_configuration" "destination_to_source" {
  provider = aws.destination
  # # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.destination]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.destination.id

  rule {
    id = "S3Replication"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.source.arn
      storage_class = "STANDARD"
    }
  }
}