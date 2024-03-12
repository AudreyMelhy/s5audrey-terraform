resource "aws_kms_key" "rds_master_password_key" {
  description             = "KMS key for encrypting RDS master password"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = var.default_tag
  }
}

resource "aws_kms_alias" "rds_master_password_alias" {
  name          = "alias/rds_master_password"
  target_key_id = aws_kms_key.rds_master_password_key.key_id
}