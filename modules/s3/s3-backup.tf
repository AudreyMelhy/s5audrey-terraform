# # Create backup S3 buckets in different regions
# locals {
#   backup_buckets = {
#     # Define each backup bucket in different regions
#     us-west-1 = format("%s-%s-s3-backup-state-us-west-1", var.tags.id, var.tags.owner),
#     us-west-2 = format("%s-%s-s3-backup-state-us-west-2", var.tags.id, var.tags.owner),
#     # Add more regions as needed
#   }
# }

resource "aws_s3_bucket" "backup" {
  provider = aws.backup

  tags = {
    Name = "BackupStateBucket"
  }
}

# resource "aws_s3_bucket_acl" "backup_acl" {
# #   for_each = local.backup_buckets
#   bucket   = aws_s3_bucket.backup[each.key].bucket
#   acl      = "private"
# }

resource "aws_s3_bucket_versioning" "backup" {
  bucket = aws_s3_bucket.backup.id
  versioning_configuration {
    status = "Enabled"
  }
}











# # Create backup S3 buckets in multiple regions
# resource "aws_s3_bucket" "backup" {
#   for_each = { for region in var.backup_regions : region => format("%s-%s-s3-backup-state", var.tags.id, var.tags.owner, region) }

#   region = each.key
#   bucket = each.value
# }

# # Enable versioning for each backup bucket
# resource "aws_s3_bucket_versioning" "backup" {
#   for_each = aws_s3_bucket.backup

#   bucket = each.value.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
