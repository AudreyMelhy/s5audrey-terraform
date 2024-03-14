resource "aws_s3_bucket" "destination" {
  provider = aws.destination
  bucket = format("%s-%s-bucket-destination", var.tags.id, var.tags.owner)
}

resource "aws_s3_bucket_versioning" "destination" {
  # provider = aws.destination

  bucket = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_bucket_acl" "destination_bucket_acl" {
#   provider = aws.destination

#   bucket = aws_s3_bucket.destination.id
#   acl    = "private"
# }


