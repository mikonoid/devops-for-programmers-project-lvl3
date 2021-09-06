resource "digitalocean_droplet" "web" {
  count              = 2
  image              = "docker-20-04"
  name               = "${var.project_name}-web-${count.index + 1}"
  region             = "ams3"
  size               = "s-1vcpu-1gb"
  private_networking = true
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]

  tags = [var.project_name]
}
