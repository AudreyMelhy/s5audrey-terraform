aws_region = ["us-east-1", "us-east-2"]
vpc_id     = "vpc-014813116a3f08117"
subnet_ids = ["subnet-0dafda3a023daf0f0", "subnet-03381cfe7b075dcc6", "subnet-0f03c20123d5947c3"]
sub_grp    = "s5audrey_phase_subnet_group"
sec_grp    = "s5audrey_phase_security_group"
Av_zones   = ["us-east-1a", "us-east-1e", "us-east-1d"]

tags = {
  "id"      = "001"
  "owner"   = "s5audrey"
  "project" = "a1_s5"
  "phase"   = "aurora_postgresql_module"
}


cluster = {
  "identifier"          = "artifactory-aurora-postgres-cluster"
  "engine"              = "aurora-postgresql"
  "engineversion"       = "11.9" # Update with desired PostgreSQL version
  "dbname"              = "mydatabase123"
  "dbusername"          = "s5audrey"
  "dbpassword"          = "SuperSecretPassword" # Replace with a secure password
  "skip_final_snapshot" = true                  # Optional, set to true if you don't want a final snapshot
  "storage_encryption"  = true
  "backup_retention"    = 0
  "backup_window"       = "07:00-09:00"
  "deletion_protection" = false
}


instance = {
  "name"          = "aurora_instances"
  "count"         = 1
  "class"         = "db.r5.large" #db.t4g.small
  "accessibility" = "false"
}

param_grp = {
  "name"        = "cluster-parameter-group"
  "family"      = "aurora-postgresql11"
  "description" = "Cluster parameter group"
}