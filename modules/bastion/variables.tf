variable "aws_region" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "volume_size" {
  type = string
}

variable "api_termination" {
  type = bool
}

variable "pub_ip" {
  type = bool
}

variable "tenancy" {
  type = string
}

variable "key" {
  type = string
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
    "resource"      = "bastion_module"
  }
}


