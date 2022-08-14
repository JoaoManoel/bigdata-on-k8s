variable "do_token" {}

variable "k8s_cluster_name" {
  type = string
  default = "k8s-big-data"
}

variable "workers_count" {
  type = number
  default = 3
}
