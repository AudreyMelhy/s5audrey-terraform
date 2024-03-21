terraform {
  required_version = "~> 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  alias  = "source"
  region = "us-east-1"
}

provider "aws" {
  alias  = "destination"
  region = "us-east-2"
}
