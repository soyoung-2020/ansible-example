provider "helm" {
 kubernetes {
   config_path = "~/.kube/config"
 }
}
 
resource "helm_release" "mysql-release" {
 name       = "mysql-release"
 repository = "https://charts.bitnami.com/mysql"
 chart      = "mysql"
}
