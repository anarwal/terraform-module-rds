data "aws_caller_identity" "current" {}

data "aws_subnet" "private_selected" {
  id = element(var.private_subnet_id, 0)
}

data "aws_subnet" "public_selected" {
  id = element(var.public_subnet_id, 0)
}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }

  owners = ["aws-marketplace"]
}
