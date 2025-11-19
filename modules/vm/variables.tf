variable "ami_filter_owner" {
  description = "The owner of the AMI"
  type        = string
  default     = "amazon"
}

variable "ami_filter_name" {
    description = "The name filter for the AMI"
    type        = string
    default     = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
}

variable "type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

variable "security_groups" {
    description = "List of security group IDs to associate with the instance"
    type        = list(string)
    default     = []
}

variable "tags" {
    description = "A map of tags to assign to the instance"
    type        = map(string)
    default     = {}
}

variable "key_name" {
    description = "The name for the SSH key pair"
    type        = string
}