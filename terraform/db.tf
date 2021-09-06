resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.postgres.id
  name       = "${var.project_name}-database"

  lifecycle {
    create_before_destroy = true
  }
}

resource "digitalocean_database_cluster" "postgres" {
  name       = "${var.project_name}-postgres"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}
