# TODO FIX THIS LATER [*]
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example[*].id
}

# TODO FIX THIS LATER [*]
output "public_ip" {
  description = "The public IP address of the instance"
  value       = aws_instance.example[*].public_ip
}

output "private_key_pem" {
  description = "The private key in PEM format"
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
}

output "public_key_openssh" {
  description = "The public key in OpenSSH format"
  value       = tls_private_key.ssh_key.public_key_openssh
  sensitive   = true
}

output "key_name" {
  description = "The name of the SSH key pair"
  value       = aws_key_pair.ssh_key.key_name
}

output "private_key_path" {
  description = "The local path to the private key file"
  value       = local_file.private_key.filename
}

# TODO FIX THIS LATER [*]
output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh -i ${local_file.private_key.filename} ubuntu@${aws_instance.example[*].public_ip}"
}