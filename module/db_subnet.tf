resource "aws_db_subnet_group" "rds_subnet" {
  description = format("Default database subnet group for %s", var.vpc_id)
  subnet_ids  = var.private_subnet_id
  tags        = { "Name" = format("%s-default-rds-subnet-group", module.rds_label.name), "Environment" = module.rds_label.stage}
}