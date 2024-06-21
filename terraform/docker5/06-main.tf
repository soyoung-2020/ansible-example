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

resource "docker_container" "bookstack" {
  image = docker_image.bookstack.latest
  name  = "bookstack_${terraform.workspace}"
  networks_advanced {
    name = "bookstack_network_${terraform.workspace}"
  }
  ports {
    internal = 80
    external = (terraform.workspace == "dev") ? 8081 : 8080
  }
  volumes {
    volume_name = "bookstack_data_${terraform.workspace}"
    container_path = "/config"
  }
  env = [
      "PUID=1000",
      "PGID=1000",
      (terraform.workspace == "dev") ? "APP_URL=http://localhost:8081" : "APP_URL=http://localhost:8080",
      "DB_HOST=bookstack_mariadb_${terraform.workspace}",
      "DB_USER=bookstack",
      "DB_DATABASE=bookstackapp",
      "DB_PASSWORD=bookstackpass"
  ]
  depends_on = [
      docker_container.bookstack_mariadb,
      docker_image.bookstack,
      docker_network.bookstack_network,
  ]
}
