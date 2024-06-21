provider "kubernetes" {
 config_path = "~/.kube/config"
 config_context = "my-context"
}
resource "kubernetes_deployment" "default" {
 metadata {
   name      = "product-go-micro"
   namespace = "default"
 }
 spec {
   replicas = 4
   selector {
     match_labels = {
       admin = "shadowshotx"
     }
   }
   template {
     metadata {
       labels = {
         admin = "shadowshotx"
       }
     }
     spec {
       container {
         image = "shadowshotx/product-go-micro"
         name  = "product-go-micro"
         port {
           container_port = 80
         }
       }
     }
   }
 }
}
