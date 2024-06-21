 data "docker_image" "my-site" {
 name = "shadowshotx/product-go-micro:latest"
}
resource "docker_container" "my-site" {
 image = data.docker_image.my-site.name
 name  = "my-site"
}
