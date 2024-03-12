

terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    key    = "aurora-db/terraform.tfstate"
    region = "us-east-1"

    # dynamodb_table = "terraform-lock-table" # Optional: Enable DynamoDB table for state locking


  }
}