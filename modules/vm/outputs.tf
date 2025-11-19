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

output "ssh_commands" {
  description = "SSH commands to connect to the instances"
  value       = [for instance in aws_instance.example : "ssh -i ${local_file.private_key.filename} ubuntu@${instance.public_ip}"]
}