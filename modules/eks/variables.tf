# Variables
variable "aws_region" {
  type = string  
}

variable "AZs" {
  type = list(string)  
}

variable "environment" {
  type = string
}

variable "instance_type" {
    type = string
  
}

variable "image_id" {
    type = string
  
}

variable "eks_version" {
  type = number
}

variable "tags" {
    type = map(string)
}

variable "public_subnets" {
    type = list(string)
}

variable "endpoint_public_access" {
    type = bool
}

variable "endpoint_private_access" {
    type = bool
}
