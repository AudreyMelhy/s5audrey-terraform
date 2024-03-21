aws_region                  = "us-east-1"
# AZs = ["us-east-1a", "us-east-1d", "us-east-1f", "us-east-1b", "us-east-1c"]
instance_type = "t2.micro"
image_id = "ami-080e1f13689e07408"
AZs = ["subnet-0dafda3a023daf0f0","subnet-0f03c20123d5947c3","subnet-0a1a9c9bbf4e8a07b","subnet-0ec7d577a39c416fa","subnet-075b4dcfc5fcc7c1c"]

environment = "prod"
eks_version             = 1.29 #latest
endpoint_private_access = false
endpoint_public_access  = true

tags = {
  id      = "001"
  owner   = "s5audrey"
  project = "a1_s5"
  phase   = "eks_module"
}



public_subnets = ["subnet-0dafda3a023daf0f0", "subnet-0f03c20123d5947c3", "subnet-0a1a9c9bbf4e8a07b", "subnet-0ec7d577a39c416fa", "subnet-075b4dcfc5fcc7c1c"]
