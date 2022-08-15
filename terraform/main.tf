resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
  name    = var.k8s_cluster_name
  region  = "nyc1"
  version = "1.23.9-do.0"

  node_pool {
    name       = "${var.k8s_cluster_name}-worker-pool"
    size       = "s-4vcpu-8gb"
    node_count = var.workers_count
  }
}

provider "kubernetes" {
  host                   = digitalocean_kubernetes_cluster.k8s_cluster.endpoint
  token                  = digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].cluster_ca_certificate
  )
}

provider "helm" {
  kubernetes {
    host                   = digitalocean_kubernetes_cluster.k8s_cluster.endpoint
    token                  = digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].token
    cluster_ca_certificate = base64decode(
      digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].cluster_ca_certificate
    )
  }
}
