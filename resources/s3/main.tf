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
  region = local.aws_region_main
}

provider "aws" {
  alias  = "destination"
  region = local.aws_region_backup
}

locals {
    aws_region_main = "us-east-1"
    aws_region_backup = "us-east-2"
    tags = {
        id      = "001"
        owner   = "s5audrey"
        project = "a1_s5"
        phase   = "backend_module"

    }
}

module "s3_backend_with_replication" {
  source            = "github.com/AudreyMelhy/s5audrey-terraform//resources/s3"
  region            = "local.region"
  cidr              = "local.vpc_cidr_block"
  availability_zone = "local.availability_zones"
  environment       = "local.environment"
  tags              = "local.tags"
}
