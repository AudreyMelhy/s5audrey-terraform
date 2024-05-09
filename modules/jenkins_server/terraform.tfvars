aws_region      = "us-east-1"
instance_type   = "t2.medium"
volume_size     = "30"
pub_ip          = true
api_termination = true
key             = "terraform-aws"

internal = false

lb_type = "application"

lb_protection = false

desired_capacity = 1
max_size         = 2
min_size         = 1
zone_sub         = "jenkins"
record_type      = "CNAME"
domain_name      = "audreyapp.com"

tags = {
  id          = "001"
  project     = "alpha"
  owner       = "AudreyMelhy"
  environment = "dev"
  resource    = "bastion_module"
}