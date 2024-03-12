data "aws_secretsmanager_secret" "retrieved_secret" {
  name = "rds_master_password_secret3" # Replace with the name of your secret in Secrets Manager
  depends_on = [
    aws_secretsmanager_secret.rds_master_password_secret3
  ]
}

data "aws_secretsmanager_secret_version" "retrieved_secret_version" {
  secret_id = data.aws_secretsmanager_secret.retrieved_secret.id
}