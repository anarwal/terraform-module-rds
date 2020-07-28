resource "aws_kms_key" "rds_kms_key" {
  description             = "RDS KMS key"
  deletion_window_in_days = 10
  tags                    = module.rds_label.tags
  enable_key_rotation     = var.enable_key_rotation
}