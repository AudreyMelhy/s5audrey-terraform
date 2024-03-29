variable "aws_region_main" {
  type = string
}

variable "aws_region_backup" {
  type = string
}

variable "tags" {
  type = map(any)
}

variable "backup_regions" {
  description = "List of AWS regions where backup S3 buckets should be created"
  type        = list(string)
  default     = ["us-east-2"]
}

variable "account_id" {
  type = string
}

# variable "bucket_source" {
#   type = string
# }

# variable "dynamo_table" {
#   type = string
# }