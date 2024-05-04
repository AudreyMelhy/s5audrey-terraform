variable "aws_region_main" {
  type    = string
  default = "us-east-1"
}

variable "aws_region_backup" {
  type    = string
  default = "us-east-2"
}

variable "vpc_id" {
  type = string
}
variable "database_name" {
  description = "The name of the database"
  default     = "mydatabase"
}

variable "cluster" {
  type = any
}

variable "instance" {
  type = any
}

variable "param_grp" {
  type = any
}

variable "subnet_ids" {
  description = "The IDs of the default subnets"
  type        = list(string)

}

variable "sec_grp" {
  description = "The name of the security group"
  type        = string
}

variable "sub_grp" {
  description = "The name of the subnet group"
  type        = string
}

variable "tags" {
  type = map(any)
}

variable "ing_from_port" {
  type    = number
  default = 5432
}

variable "ing_to_port" {
  type    = number
  default = 5432
}

variable "ing_prot" {
  type    = string
  default = "tcp"
}

variable "eg_from_port" {
  type    = number
  default = 0
}

variable "eg_to_port" {
  type    = number
  default = 0
}

variable "eg_prot" {
  type    = string
  default = "-1"
}

variable "cidr_blocks" {
  description = "List of CIDR blocks"
  default     = ["0.0.0.0/0"]
}

variable "Av_zones" {
  type = list(any)
  default = [
    "us-east-1a",
    "us-east-1e",
    "us-east-1d",
  ]
}

variable "default_tag" {
  type        = string
  description = "A default tag to add to everything"
  default     = "terraform_aws_rds_secrets_manager"
}

# variable "db_credentials" {
#   type = string
# }
