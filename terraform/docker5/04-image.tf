terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host     = "ssh://vagrant@ansible-node1:22"
#  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

resource "docker_network" "bookstack_network" {
    name = "bookstack_network_${terraform.workspace}"
}

resource "docker_image" "bookstack" {
    name = "linuxserver/bookstack:21.11.3"
    keep_locally = true
}

resource "docker_image" "mariadb" {
    name = "linuxserver/mariadb:10.5.13"
    keep_locally = true
}
