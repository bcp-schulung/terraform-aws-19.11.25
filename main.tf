terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.21.0"
    }
    tls = {
        source = "hashicorp/tls"
        version = "~> 4.0"
    }
    local = {
        source = "hashicorp/local"
        version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
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

module "vm" {
  source = "./modules/vm"

  count = 3

  key_name = "${var.username}-${count.index}"
  tags = {
    Name = "${var.username}-${count.index}"
  }
  security_groups = [module.security_group.id]
}