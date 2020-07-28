output "rds_bastion_ip" {
  value = module.rds.rds_bastion_ip
}

output "rds_kms_key" {
  value = module.rds.rds_kms_key
}

output "rds_address" {
  value = module.rds.rds_address
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "rds_status" {
  value = module.rds.rds_status
}

output "rds_instance_id" {
  value = module.rds.rds_instance_id
}

output "rds_sg_internal_mysql_name" {
  value = module.rds.rds_sg_internal_mysql_name
}

output "rds_sg_internal_mysql_ingress" {
  value = module.rds.rds_sg_internal_mysql_ingress
}

output "rds_sg_external_mysql_ssh_name" {
  value = module.rds.rds_sg_external_mysql_ssh_name
}

output "rds_sg_external_mysql_ssh_ingress" {
  value = module.rds.rds_sg_external_mysql_ssh_ingress
}
