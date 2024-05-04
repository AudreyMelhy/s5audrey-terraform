terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
