output "jenkins_sec_grp_id" {
  description = "ID of the created sec grp"
  value       = aws_security_group.jenkins_sg.id
}

output "bastion_sec_grp_id" {
  description = "ID of the created sec grp"
  value       = aws_security_group.bastion_sg.id
}

