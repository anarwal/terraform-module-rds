module "mysql" {
  source                          = "terraform-aws-modules/rds/aws"
  version                         = "~> 2.13.0"
  identifier                      = format("%s-mysql", module.rds_label.name)
  engine                          = "mysql"
  engine_version                  = "5.7"
  instance_class                  = "db.t2.large"
  allocated_storage               = var.rds_allocated_storage
  storage_encrypted               = true
  kms_key_id                      = aws_kms_key.rds_kms_key.arn
  name                            = var.mysql_name
  username                        = var.mysql_username
  password                        = var.mysql_password
  port                            = var.mysql_port
  vpc_security_group_ids          = [aws_security_group.internal_mysql.id]
  maintenance_window              = var.maintenance_window
  backup_window                   = var.backup_window
  major_engine_version            = "5.7"
  multi_az                        = var.rds_multi_az
  backup_retention_period         = var.backup_retention_days
  enabled_cloudwatch_logs_exports = ["error", "general"]
  subnet_ids                      = var.private_subnet_id
  family                          = "mysql5.7"
  skip_final_snapshot             = true
  deletion_protection             = false
  ca_cert_identifier              = "rds-ca-2019"
  tags                            = { "Owner" = module.rds_label.name, "Environment" = module.rds_label.stage }
}
