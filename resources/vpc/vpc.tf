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
  region = local.region
}

locals {
  region             = "us-east-1"
  vpc_cidr_block     = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  environment        = "dev"

  tags = {
    "id"      = "001"
    "owner"   = "s5audrey"
    "project" = "a1_s5"
    "phase"   = "vpc_module"
  }
}

module "vpc" {
  source            = "cd ../../modules/vpc"
  region            = "local.region"
  cidr              = "local.vpc_cidr_block"
  availability_zone = "local.availability_zones"
  environment       = "local.environment"
  tags              = "local.tags"
}
