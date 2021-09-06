resource "digitalocean_domain" "domain" {
  name       = var.domain_name
  ip_address = digitalocean_loadbalancer.loadbalancer.ip

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [
    digitalocean_loadbalancer.loadbalancer
  ]
}
