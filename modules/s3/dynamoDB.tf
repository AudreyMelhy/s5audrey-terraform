# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  provider       = aws.source
  name           = format("%s-%s-terraform_state_lock", var.tags.id, var.tags.owner)
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}