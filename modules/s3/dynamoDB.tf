# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  provider       = aws.main
  name         = format("%s-%s-terraform_state_lock", var.tags.id, var.tags.owner)
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}