variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ssh_key_name" {
  description = "Name for the SSH key in DigitalOcean"
  type        = string
  default     = "terraform-ssh-key"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "droplet_name" {
  description = "Name of the droplet"
  type        = string
  default     = "terraform-vm"
}

variable "droplet_region" {
  description = "DigitalOcean region"
  type        = string
  default     = "nyc3"
}

variable "droplet_size" {
  description = "Droplet size/plan"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "droplet_image" {
  description = "Droplet image/OS"
  type        = string
  default     = "ubuntu-22-04-x64"
}

variable "droplet_tags" {
  description = "Tags for the droplet"
  type        = list(string)
  default     = ["terraform", "ansible"]
}
