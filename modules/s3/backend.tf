# terraform {
#   backend "s3" {
#     bucket = "${aws_s3_bucket.source.id}"
#     key    = "backend/terraform.tfstate"
#     region = "us-east-1"
#     dynamodb_table = "${aws_dynamodb_table.terraform_state_lock}"
#     encrypt        = true
#   }
# }
