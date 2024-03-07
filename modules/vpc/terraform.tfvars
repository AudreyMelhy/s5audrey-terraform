aws_region     = "us-east-1"
vpc_cidr_block = "10.0.0.0/16"

availability_zones = ["us-east-1a"]
# availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]

environment = "dev"
# nat_gateway_count = 1

tags = {
  id      = "001"
  owner   = "s5audrey"
  project = "a1_s5"
  phase   = "vpc_module"
}