resource "kubernetes_namespace" "cicd" {
  metadata {
    name = "cicd"
  }
}

resource "kubernetes_namespace" "storage" {
  metadata {
    name = "storage"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "4.10.6"

  namespace = kubernetes_namespace.cicd.metadata[0].name
}
