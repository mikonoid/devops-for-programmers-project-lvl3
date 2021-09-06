terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "1.22.2"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

variable "do_token" {}
variable "pvt_key" {
  default = "~/.ssh/id_rsa"
}
variable "domain_name" {
  default = "lvl3.devops-baby.club"
}

variable "project_name" {
  default = "hexlet-project-lvl3"
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "terraform" {
  name = "key"
}

# Configure the Datadog provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

variable "datadog_api_key" {}
variable "datadog_app_key" {}
