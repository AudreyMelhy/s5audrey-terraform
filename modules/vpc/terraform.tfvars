aws_region     = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"
vpc_name       = "audrey_vpc"


#availability_zones = ["us-east-1a"]
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

nat_gateway_count = 0
eip_count         = 0


tags = {
  id          = "001"
  owner       = "AudreyMelhy"
  environment = "dev"
  phase       = "vpc_module"
}