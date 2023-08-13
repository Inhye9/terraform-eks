variable "cluster_name" {
  type        = string
  description = "eks cluster name"
  default     = "tf-eks-cluster"
}

variable "my_ip_cidr"{
  type        = string
}
