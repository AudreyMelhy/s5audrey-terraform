terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    # dynamodb_table = "AudreyM-tfstate-locking"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
