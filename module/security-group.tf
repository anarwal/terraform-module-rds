resource "aws_security_group" "internal_mysql" {
  name_prefix = format("%s-%s-internal-mysql-", module.rds_label.name, module.rds_label.stage)
  description = "Allows incoming psql traffic from vpc"
  vpc_id      = var.vpc_id
  tags        = { "Name" = format("%s-internal-mysql",module.rds_label.name),"Environment" = module.rds_label.stage }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  egress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.selected.cidr_block]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "external_mysql_ssh" {
  name_prefix = format("%s-%s-external-mysql-ssh-", module.rds_label.name, module.rds_label.stage)
  description = "Allows ssh from the world"
  vpc_id      = var.vpc_id
  tags        = { "Name" = format("%s-external-mysql-ssh",module.rds_label.name), "Environment" = module.rds_label.stage }


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
