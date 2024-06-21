# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_network" "private_network" {
  name = "nginx_network"
  driver = "bridge"
}

# Create a container
resource "docker_container" "nginxtest" {
  image = docker_image.nginx.image_id
  name  = "nginxtest"
  network_mode = "bridge"
  networks_advanced {
    name = docker_network.private_network.name
    aliases = ["nginx_network"]
  }
  ports {
    internal = "80"
    external = "8000"
  }
}
