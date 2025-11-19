output "user_name" {
  value = aws_iam_user.this.name
}

output "role_name" {
  value = aws_iam_role.this.name
}