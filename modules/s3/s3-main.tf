# Create the main S3 bucket for storing the state file
resource "aws_s3_bucket" "main" {
  provider = aws.main
  bucket = format("%s-%s-s3-main-state", var.tags.id, var.tags.owner)

  tags = {
    Name = "MainStateBucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "main" {

  bucket = aws_s3_bucket.main.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}


resource "aws_s3_bucket_acl" "main_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.main]
  provider = aws.main

  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "main" {
  provider = aws.main

  bucket = aws_s3_bucket.main.id
  versioning_configuration {
    status = "Enabled"
  }
}







# resource "aws_s3_bucket" "source" {
#   provider = aws.main
#   bucket   = format("%s-%s-s3-main-state", var.tags.id, var.tags.owner)
# }

# resource "aws_s3_bucket_acl" "source_bucket_acl" {
#   provider = aws.main

#   bucket = aws_s3_bucket.source.id
#   acl    = "private"
# }

# resource "aws_s3_bucket_versioning" "source" {
#   provider = aws.main

#   bucket = aws_s3_bucket.source.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

