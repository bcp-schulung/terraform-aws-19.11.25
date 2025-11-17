terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.21.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "allow_ssh" {
  name       = "allow_ssh"
  vpc_id     = aws_default_vpc.default.id

  tags = {
    Name = "Allow SSH"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_rule" {
  security_group_id = aws_security_group.allow_ssh.id
  from_port         = 22
  to_port           = 22
  ip_protocol = "tcp"
  cidr_ipv4 = aws_default_vpc.default.cidr_block
}

resource "aws_vpc_security_group_egress_rule" "allow_all_rule" {
  security_group_id = aws_security_group.allow_ssh.id
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  cidr_ipv4         = aws_default_vpc.default.cidr_block
  
}

resource "aws_instance" "example" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.aws_instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.username
    Terraform = "true"
  }
}