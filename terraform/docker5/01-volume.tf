terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

resource "docker_volume" "bookstack_data" {
  name = "bookstack_data_${terraform.workspace}"
}
