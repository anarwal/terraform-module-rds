resource "aws_instance" "rds_bastion" {
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.public_selected.id
  vpc_security_group_ids = [aws_security_group.external_mysql_ssh.id]
  key_name               = var.ssh_key_name
  ami                    = data.aws_ami.centos.id
  volume_tags            = { "Name" = format("%s-mysql-bastion-ebs", module.rds_label.name), "Environment" = module.rds_label.stage }
  tags                   = { "Name" = format("%s-mysql-bastion", module.rds_label.name), "Environment" = module.rds_label.stage }
}

resource "aws_eip" "rds_bastion" {
  instance = aws_instance.rds_bastion.id
  vpc      = true
  tags     = { "Name" = format("%s-rds-bastion-eip", module.rds_label.name), "Environment"= module.rds_label.stage}
}
