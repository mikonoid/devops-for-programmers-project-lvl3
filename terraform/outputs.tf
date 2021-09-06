output "webserver_ips" {
  value = digitalocean_droplet.web.*.ipv4_address
}

output "database_credentials" {
  value     = digitalocean_database_cluster.postgres
  sensitive = true
}
