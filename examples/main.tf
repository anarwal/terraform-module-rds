provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "rds" {
  source            = "../module/"
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
