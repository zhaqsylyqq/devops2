output "droplet_ip_address" {
  description = "The public IP address of the droplet"
  value       = digitalocean_droplet.vm.ipv4_address
}

output "droplet_name" {
  description = "The name of the droplet"
  value       = digitalocean_droplet.vm.name
}

output "ssh_connection_string" {
  description = "SSH connection command for root user"
  value       = "ssh root@${digitalocean_droplet.vm.ipv4_address}"
}

output "ansible_user_ssh_connection" {
  description = "SSH connection command for ansible user"
  value       = "ssh ansible@${digitalocean_droplet.vm.ipv4_address}"
}