variable "name" {
  description = "The name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "The id of the vpc to use"
  type = string
}

variable "cidr_block" {
  description = "The cidr block to use"
  type = string
  default = "0.0.0.0/0"
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port      = number
    protocol    = string
    cidr_ipv4    = string
  }))
  default = [
    {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_ipv4   = "0.0.0.0/0"
    }
  ]
}

variable "egress_rules" {
    description = "List of egress rules"
    type = list(object({
        from_port   = number
        to_port      = number
        protocol    = string
        cidr_ipv4    = string
    }))
    default = [
        {
            from_port   = 0
            to_port     = 0
            protocol    = "-1"
            cidr_ipv4   = "0.0.0.0/0"
      }
    ]
}