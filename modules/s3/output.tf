# Output file to list all resources to be created

# # Output for S3 bucket replication configuration
# output "s3_bucket_replication_configuration" {
#   value = aws_s3_bucket_replication_configuration.replication
#   sensitive = true
# }


# Output for aws_iam_role
output "aws_iam_role" {
  value = aws_iam_role.s3_replication_role
}

# Output for aws_iam_role_policy
output "aws_iam_policy" {
  value = aws_iam_policy.s3_private_acl_policy
}

# Output for aws_iam_role_policy_attachment
output "aws_iam_role_policy_attachment" {
  value = aws_iam_role_policy_attachment.s3_replication_policy_attachment
}

# Output for S3 bucket
output "aws_s3_bucket_s" {
  value = aws_s3_bucket.source
}

# # Output for S3 bucket
# output "aws_s3_bucket_versioning_s" {
#   value = aws_s3_bucket_versioning.source
# }


# Output for S3 bucket
output "aws_s3_bucket_d" {
  value = aws_s3_bucket.destination
}

# # Output for S3 bucket
# output "aws_s3_bucket_versioning_d" {
#   value = aws_s3_bucket_versioning.destination

# }

# Output for DynamoDB table
output "aws_dynamodb_table" {
  value = aws_dynamodb_table.terraform_state_lock
}