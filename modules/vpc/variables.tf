variable "aws_region" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "availability_zones" {
  type = list(any)
}

variable "vpc_cidr_block" {
  type = string
}


variable "nat_gateway_count" {
  type    = number
  default = 0
}