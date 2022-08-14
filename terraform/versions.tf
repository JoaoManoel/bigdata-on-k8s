terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.12.1"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.6.0"
    }
  }

  required_version = "~> 1.2.0"
}
