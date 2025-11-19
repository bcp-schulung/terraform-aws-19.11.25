output "vm_ssh_commands" {
  description = "SSH commands to connect to each VM"
  value = {
    for idx, vm in module.vm : idx => vm.ssh_command
  }
}

output "vm_public_ips" {
  description = "Public IP addresses of all VMs"
  value = {
    for idx, vm in module.vm : idx => vm.public_ip
  }
}

output "vm_private_key_paths" {
  description = "Local paths to private key files for each VM"
  value = {
    for idx, vm in module.vm : idx => vm.private_key_path
  }
}

output "vm_instance_ids" {
  description = "Instance IDs of all VMs"
  value = {
    for idx, vm in module.vm : idx => vm.instance_id
  }
}
