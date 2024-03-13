
resource "aws_s3_bucket_replication_configuration" "replication" {
  provider = aws.main
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.main]

  role   = aws_iam_role.replication_role.arn
  bucket = aws_s3_bucket.main.id

  rule {
    id = "replicate-all-objects"

    # filter {
    #   prefix = "foo"
    # }

    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.backup.arn
      storage_class = "STANDARD"
    }
  }
}






# # Enable replication from main to backup bucket
# resource "aws_s3_bucket_replication" "main_replication" {
#   source_bucket = aws_s3_bucket.main.id
#   destination {
#     bucket        = aws_s3_bucket.backup.id
#     storage_class = "STANDARD"     # Set the desired storage class for replicated objects
#     account_id    = var.account_id # Set the AWS account ID of the destination bucket owner
#   }

#   replication_rule {
#     id     = "replicate-all-objects"
#     status = "Enabled"

#     priority = 1

#     destination {
#       bucket = aws_s3_bucket.backup.id
#     }

#     source_selection_criteria {
#       sse_kms_encryption_context {
#         bucket_owner = var.account_id # Set the AWS account ID of the destination bucket owner
#       }
#     }
#   }
# }
