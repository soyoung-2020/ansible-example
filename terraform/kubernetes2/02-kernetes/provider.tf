provider "kubernetes" {
  source  = "hashicorp/kubernetes"
  config_path    = "~/.kube/config"
}
