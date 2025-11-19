output "id" {
  description = "Output of the security group id"
  value = aws_security_group.security_group.id
}


output "ids" {
  description = "Output of the security group ids"
         #{ for instance in aws_instance.example : instance.id => instance.public_ip }
  value = { for security_group in aws_security_group.security_group : var.name => security_group.id } #aws_security_group.security_group[*].id
}