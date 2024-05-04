resource "aws_s3_bucket" "destination" {
  provider      = aws.destination
  force_destroy = var.force_destroy
  bucket        = format("%s-%s-bucket-destination", var.tags.id, var.tags.owner)
}

# resource "aws_s3_bucket_acl" "destination" {
#   provider = aws.destination
#   bucket   = aws_s3_bucket.destination.id
#   acl      = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_destination" {
  provider   = aws.destination
  depends_on = [aws_s3_bucket.destination]
  bucket     = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}