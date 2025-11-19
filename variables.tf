variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "eu-central-2"
  validation {
    error_message = "DAS IST GANZ UNCOOL"
    condition = contains(["eu-central-1", "us-east-1", "us-west-2"], var.aws_region)
  }
}

variable "participants" {
  description = "The participants in the exercise"
  type = list(object({
    name = string
    instanceCount = number
  }))
  default = []
}