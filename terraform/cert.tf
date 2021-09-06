resource "digitalocean_certificate" "cert" {
  name    = "${var.project_name}-cert"
  type    = "lets_encrypt"
  domains = [var.domain_name]
}
