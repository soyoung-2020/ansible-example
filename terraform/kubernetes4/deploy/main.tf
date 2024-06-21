resource "kubernetes_deployment" "whoami_deployment" {
  metadata {
    name      = "whoami-deployment"
    namespace = kubernetes_namespace.whoami.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "whoami"
      }
    }
    template {
      metadata {
        labels = {
          app = "whoami"
        }
      }
      spec {
        container {
          image = "traefik/whoami"
          name  = "whoami"
        }
      }
    }
  }
}
