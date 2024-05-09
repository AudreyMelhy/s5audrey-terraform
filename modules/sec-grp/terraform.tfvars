region = "us-east-1"

tags = {
  "id"            = "001"
  "Owner"         = " AudreyMelhy"
  "environment"   = "dev"
  "project"       = " "
  "createBy"      = "Terraform"
  "cloudProvider" = "aws"
  "resource"      = "jenkins-master"
}

ports = [
  22,
  80,
  8080,
  443
]