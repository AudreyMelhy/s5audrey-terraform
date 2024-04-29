resource "aws_s3_bucket" "source" {
  provider      = aws.source
  force_destroy = var.force_destroy
  bucket        = format("%s-%s-bucket-source", var.tags.id, var.tags.owner)
  # acl           = "private"
}

# resource "aws_s3_bucket_acl" "source" {
#   provider = aws.source
#   bucket   = aws_s3_bucket.source.id
#   acl      = "private"
# }

resource "aws_s3_bucket_versioning" "versioning_source" {
  provider   = aws.source
  depends_on = [aws_s3_bucket.source]
  bucket     = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "source" {
  bucket = aws_s3_bucket_versioning.versioning_source.id
  key    = "droeloe"
  source = "notes.txt"
}




