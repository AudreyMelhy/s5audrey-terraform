terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    # dynamodb_table = "AudreyM-tfstate-locking"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
