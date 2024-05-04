terraform {
  required_version = ">= 1.0.0"
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
  AZs = ["subnet-0dafda3a023daf0f0","subnet-0f03c20123d5947c3","subnet-0a1a9c9bbf4e8a07b","subnet-0ec7d577a39c416fa","subnet-075b4dcfc5fcc7c1c"]
  public_subnets = ["subnet-0dafda3a023daf0f0", "subnet-0f03c20123d5947c3", "subnet-0a1a9c9bbf4e8a07b", "subnet-0ec7d577a39c416fa", "subnet-075b4dcfc5fcc7c1c"]
  environment        = "dev"
  type = t2.micro
  eks_version             = 1.29
  endpoint_private_access = false
  endpoint_public_access  = true

  tags = {
    "id"      = "001"
    "owner"   = "s5audrey"
    "project" = "a1_s5"
    "phase"   = "eks_module"
  }

   
}

module "eks" {
  source            = "cd ../../modules/eks"
  region            = "local.region"
  availability_zone = "local.AZs"
  subnet_ids = "local.pulic_subnets"
  environment       = "local.environment"
  ec2_type = local.type
  cluster_version = local.eks_version
  private_access = local.endpoint_private_access
  public_access = local.endpoint_public_access
  tags              = "local.tags"
}
