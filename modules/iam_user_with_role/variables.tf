variable "name" {
  description = "Name for the IAM user and role"
  type        = string
}

variable "policy_arn" {
  description = "Policy ARN to attach to user and role"
  type        = string
}