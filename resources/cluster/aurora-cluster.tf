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
  region     = "us-east-1"
  vpc_id     = "vpc-014813116a3f08117"
  subnet_ids = ["subnet-0dafda3a023daf0f0", "subnet-03381cfe7b075dcc6", "subnet-0f03c20123d5947c3"]
  sub_grp    = "s5audrey_phase_subnet_group"
  sec_grp    = "s5audrey_phase_security_group"
  Av_zones   = ["us-east-1a", "us-east-1e", "us-east-1d"]


  tags = {
    "id"      = "001"
    "owner"   = "s5audrey"
    "project" = "a1_s5"
    "phase"   = "aurora_postgresql_module"
  }

  cluster = {
    "engine"              = "aurora-postgresql"
    "identifier"          = "artifactory-aurora-postgres-cluster"
    "engineversion"       = "11.9"
    "dbname"              = "mydatabase123"
    "dbusername"          = "s5audrey"
    "dbpassword"          = "SuperSecretPassword"
    "skip_final_snapshot" = true
    "storage_encryption"  = true
    "backup_retention"    = 7
    "backup_window"       = "07:00-09:00"
    "deletion_protection" = false
  }

  instance = {
    "name"          = "aurora_instances"
    "count"         = 1
    "class"         = "db.r5.large" #db.t4g.small
    "accessibility" = "true"
  }

  param_grp = {
    "name"        = "cluster-parameter-group"
    "family"      = "aurora-postgresql11"
    "description" = "Cluster parameter group"
  }
}

module "aurora-cluster" {
  source     = "cd ../../modules/cluster"
  region     = "local.region"
  vpc_id     = "vpc-014813116a3f08117"
  subnet_ids = "local.subnet_ids"
  sub_grp    = "local.sub_grp"
  sec_grp    = "local.sec_grp"
  Av_zones   = "local.Av_zones"
  cluster    = "local.cluster"
  instance   = "local.instance"
  param_grp  = "local.param_grp"
  tags       = "local.tag"
}