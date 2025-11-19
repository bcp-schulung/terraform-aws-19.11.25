variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "participants" {
  description = "The participants in the exercise"
  type = list(object({
    name = string
    instanceCount = number
  }))
  default = []
}