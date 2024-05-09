variable "region" {
  type    = string
  default = "us-east-1"
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
    "resource"      = "jenkins-master"
  }
}

variable "ports" {
  type = list(number)
  default = [
    22,
    80,
    8080,
    443
  ]
}
     