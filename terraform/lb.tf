resource "digitalocean_loadbalancer" "loadbalancer" {
  name   = "${var.project_name}-loadbalancer"
  region = "ams3"

  sticky_sessions {
    type               = "cookies"
    cookie_name        = "lb"
  }

  dynamic "forwarding_rule" {
    for_each = [
      {
        port     = 80
        protocol = "http"
      },
      {
        port     = 443
        protocol = "https"
      }
    ]

    content {
      entry_port = forwarding_rule.value["port"]

      entry_protocol = forwarding_rule.value["protocol"]

      target_port     = 3000
      target_protocol = "http"

      certificate_id = digitalocean_certificate.certificate.id
    }
  }

  healthcheck {
    port     = 3000
    protocol = "http"
    path     = "/"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}
