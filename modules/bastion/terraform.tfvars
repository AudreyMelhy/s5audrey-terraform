aws_region      = "us-east-1"
instance_type   = "t2.micro"
volume_size     = "30"
pub_ip          = true
api_termination = true
tenancy         = "default"
key             = "terraform-aws"

tags = {
  id          = "001"
  owner       = "AudreyMelhy"
  environment = "dev"
  resource    = "bastion_module"
}