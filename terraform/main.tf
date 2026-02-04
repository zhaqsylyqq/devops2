terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

# Create or use existing SSH key
resource "digitalocean_ssh_key" "default" {
  name       = var.ssh_key_name
  public_key = file(var.ssh_public_key_path)
}

# Create a DigitalOcean droplet
resource "digitalocean_droplet" "vm" {
  image  = var.droplet_image
  name   = var.droplet_name
  region = var.droplet_region
  size   = var.droplet_size
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
  user_data = templatefile("${path.module}/cloud-init.yaml", {
    ssh_public_key = file(var.ssh_public_key_path)
  })

  tags = var.droplet_tags
}