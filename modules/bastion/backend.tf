terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    # dynamodb_table = "AudreyM-tfstate-locking"
    key    = "bastion/terraform.tfstate"
    region = "us-east-1"
  }
}