# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "nginxtest" {
  image = docker_image.nginx.image_id
  name  = "nginxtest"

  ports {
    internal = "80"
    external = "8000"
  }
}
