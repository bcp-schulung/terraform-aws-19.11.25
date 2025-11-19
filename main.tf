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
  for_each = { for idx, partic in var.participants : idx => partic }

  source = "./modules/security_group"
  name = each.value.name
  vpc_id = aws_default_vpc.default.id
  cidr_block = aws_default_vpc.default.cidr_block
}

module "vm" {
  for_each = { for idx, partic in var.participants : idx => partic }

  source = "./modules/vm"

  participants_count = each.value.instanceCount

  key_name = each.value.name
  tags = {
    Name = each.value.name
  }
  security_groups = [module.security_group[each.value.name].id]
}
