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

resource "docker_volume" "bookstack_data" {
  name = "bookstack_data_${terraform.workspace}"
}
