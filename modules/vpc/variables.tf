variable "aws_region" {
  type = string
}

variable "availability_zones" {
  type = list(any)
}

variable "vpc_cidr_block" {
  type = string
}

variable "eip_count" {
  type = number
}

variable "nat_gateway_count" {
  type = number
}

variable "vpc_name" {
  description = "Name or identifier for the VPC"
  type        = string
}

variable "tags" {
  type = map(any)
  default = {
    "id"            = "001"
    "Owner"         = " AudreyMelhy"
    "environment"   = "dev"
    "project"       = " "
    "createBy"      = "Terraform"
    "cloudProvider" = "aws"
    "resource"      = "audrey-vpc"
  }
}

variable "vpc_options" {
  type = map(any)
  default = {
    instance_tenancy     = "default"
    enable_dns_hostnames = true
    enable_dns_support   = true

  }
}

variable "cluster_name" {
  type    = string
  default = ""
}