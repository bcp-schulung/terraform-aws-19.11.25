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

module "security_group" {
  source = "./modules/security_group"
  name = var.username
  vpc_id = aws_default_vpc.default.id
  cidr_block = aws_default_vpc.default.cidr_block
}

resource "aws_instance" "example" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.aws_instance_type
  vpc_security_group_ids = [module.security_group.id]

  tags = {
    Name = var.username
    Terraform = "true"
  }
}