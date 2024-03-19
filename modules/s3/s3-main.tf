resource "aws_s3_bucket" "source" {
  provider = "aws.source"
  bucket   = format("%s-%s-bucket-source" , var.tags.id, var.tags.owner)
  versioning {
    enabled = true
  }

  tags = var.tags
}



# resource "aws_s3_bucket_versioning" "source" {
#   # provider = aws.source
#   bucket = aws_s3_bucket.source.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }


# resource "aws_s3_bucket_acl" "source_bucket_acl" {
#   provider = aws.source

#   bucket = aws_s3_bucket.source.id
#   acl    = "private"
# }



