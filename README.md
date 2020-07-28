# terraform-module-rds

Usage:
```
module "rds" {
  source            = "./module/"
  namespace         = "eg"
  name              = "app"
  stage             = "test"
  attributes        = ["xyz"]
  ssh_key_name      = var.ssh_key_name
  vpc_id            = var.vpc_id
  public_subnet_id  = var.public_subnet_id
  private_subnet_id = var.private_subnet_id
  mysql_name        = var.mysql_name
  mysql_username    = var.mysql_username
  mysql_password    = var.mysql_password
}

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
```

## INPUT VALUES

| Input                  | Description                                                                                                                                                    | Type    | Default                | Required |
| -----------------------| ---------------------------------------------------------------------------------------------------------------------------------------------------------------| --------|------------------------|----------|
| namespace              | Namespace, which could be your organization name or abbreviation"                                                                                              |`string` | ""                     | yes      |
| stage                  | Stage, e.g. 'prod', 'staging', 'dev'                                                                                                                           |`string` | ""                     | yes      |
| name                   | Solution name, e.g. 'app' or 'jenkins'                                                                                                                         |`string` | ""                     | yes      |
| attributes             | Additional attributes                                                                                                                                          |`list`   | `<list>`               | no       |           
| delimiter              | Delimiter to be used between namespace, environment, stage, name and attributes                                                                                |`string` | "-"                    | no       |
| enable_key_rotation    | Specifies whether key rotation is enabled                                                                                                                      | `bool`  | `true`                 | no       |
| ssh_key_name           | SSH key for ec2 ssh                                                                                                                                            | `string`| ""                     | yes      |
| vpc_id                 | VPC-id                                                                                                                                                         | `string`| ""                     | yes      |
| public_subnet_id       | A list of public subnet IDs to attach                                                                                                                          | `list`  | ""                     | yes      |
| private_subnet_id      | A list of private subnet IDs to attach                                                                                                                         | `list`  | ""                     | yes      |
| rds_allocated_storage  | The allocated storage in gigabytes                                                                                                                             | `string`| `20`                   | no       |
| maintenance_window     | The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'. Eg: 'Mon:00:00-Mon:03:00'                                                             | `string`| `Mon:00:00-Mon:03:00"` | no       |
| backup_window          | The daily time range (in UTC) during which automated backups are created if they are enabled. Example: '09:46-10:16'. Must not overlap with maintenance_window | `string`| `"03:00-06:00"`        | no       |
| mysql_name             | The DB name to create. If omitted, no database is created initially                                                                                            | `string`| ""                     | yes      |
| mysql_username         | Username for the master DB user                                                                                                                                | `string`| ""                     | yes      |
| mysql_password         | Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file                                                   | `string`| ""                     | yes      |
| mysql_port             | The port on which the DB accepts connections                                                                                                                   | `number`| `3306`                 | no       |
| rds_multi_az           | The allocated storage in gigabytes                                                                                                                             | `bool`  | `false`                | no       |
| backup_retention_days  | Specifies if the RDS instance is multi-AZ                                                                                                                      | `number`| `1`                    | no       |                                        

## OUTPUT VALUE NAMES

| Name                               | Description                                 | 
| -----------------------------------| --------------------------------------------| 
| rds_bastion_ip                     | Public IP of mysql bastion                  | 
| rds_kms_key                        | KMS key for mysql data encryption at rest   | 
| rds_address                        | The address of the RDS instance             | 
| rds_endpoint                       | The connection endpoint                     | 
| rds_status                         | The RDS instance status                     | 
| rds_instance_id                    | The RDS instance ID                         | 
| rds_sg_internal_mysql_name         | Security Group name for mysql instance      | 
| rds_sg_internal_mysql_ingress      | Security Group ingress Rules mysql instance | 
| rds_sg_external_mysql_ssh_name     | Security Group name for mysql bastion       | 
| rds_sg_external_mysql_ssh_ingress  | Security Group ingress Rules mysql bastion  | 