variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "aws_instance_type" {
  description = "The type of ec2 instance to use"
  type = string
  default = "t2.micro"
}

variable "username" {
  type = string
  default = "ben"
}