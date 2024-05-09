data "aws_key_pair" "terraform-aws" {
  key_name           = "terraform-aws"
  include_public_key = true

  #   filter {
  #     name   = "tag:env"
  #     values = ["dev"]
  #   }
}




