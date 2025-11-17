terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "6.21.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami = "ami-089a7a2a13629ecc4"
  instance_type = "t2.micro"

  tags = {
    Name = "ben-maschine"
    Terraform = "true"
  }
}