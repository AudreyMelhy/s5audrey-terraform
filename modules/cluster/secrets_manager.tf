# Generate a random password for the RDS instance
resource "random_password" "rds_master_password" {
  length           = 16     # Set the length of the password
  special          = true   # Include special characters in the password
  override_special = "_%@#" # Optionally override the default set of special characters
}


resource "aws_secretsmanager_secret" "rds_master_password_secret3" {
  name                    = "rds_master_password_secret3"              # Specify the name for the secret
  kms_key_id              = aws_kms_key.rds_master_password_key.key_id # Specify the KMS key ID
  description             = "RDS Admin password"
  recovery_window_in_days = 7

  tags = {
    Name = var.default_tag
  }
}

resource "aws_secretsmanager_secret_version" "rds_master_password_version" {
  secret_id     = aws_secretsmanager_secret.rds_master_password_secret3.id # Reference the secret ID
  secret_string = random_password.rds_master_password.result               # Use the randomly generated password as the secret value
}
