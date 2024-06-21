data "docker_registry_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_image" "ngnix" {
  name          = data.docker_registry_image.nginx.name
  pull_triggers = [data.docker_registry_image.nginx.sha256_digest]
}

resource "docker_image" "nginxtest" {
  name = "nginxtest"
  build {
    context = "."
    tag     = ["nginxtest:v1"]
    build_arg = {
      name : "nginxtest"
    }
    label = {
      author : "test"
    }
  }
}
