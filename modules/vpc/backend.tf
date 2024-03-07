terraform {
  backend "s3" {
    bucket = "terraform-project-main"
    key    = "vpc/terraform.tfstate"
    region = "us-east-1"
  }
}
