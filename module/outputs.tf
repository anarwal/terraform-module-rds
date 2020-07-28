output "rds_bastion_ip" {
  value = aws_eip.rds_bastion.public_ip
}

output "rds_kms_key" {
  value = aws_kms_key.rds_kms_key.key_id
}

output "rds_address" {
  value = module.mysql.this_db_instance_address
}

output "rds_endpoint" {
  value = module.mysql.this_db_instance_endpoint
}

output "rds_status" {
  value = module.mysql.this_db_instance_status
}

output "rds_instance_id" {
  value = module.mysql.this_db_instance_id
}

output "rds_sg_internal_mysql_name" {
  value = aws_security_group.internal_mysql.name
}

output "rds_sg_internal_mysql_ingress" {
  value = aws_security_group.internal_mysql.ingress
}

output "rds_sg_external_mysql_ssh_name" {
  value = aws_security_group.external_mysql_ssh.name
}

output "rds_sg_external_mysql_ssh_ingress" {
  value = aws_security_group.external_mysql_ssh.ingress
}