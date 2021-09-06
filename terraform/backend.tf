terraform {
  backend "remote" {
    organization = "feycot"

    workspaces {
      name = "hexlet-project-lvl3"
    }
  }
}
