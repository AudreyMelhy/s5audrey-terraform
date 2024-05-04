aws_region_main   = "us-east-1"
aws_region_backup = "us-east-2"
account_id        = "763237209150"
# bucket_source = "format("%s-%s-bucket-source" , var.tags.id, var.tags.owner)"
# dynamo_table = format("%s-%s-terraform_state_lock", var.tags.id, var.tags.owner)

tags = {
  id      = "001"
  owner   = "s5audrey"
  project = "a1_s5"
  phase   = "backend_module"
}

