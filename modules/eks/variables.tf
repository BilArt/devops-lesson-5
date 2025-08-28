variable "cluster_name" {
  description = "EKS Cluster Name"
  type        = string
}

variable "subnet_ids" {
  description = "List of Subnet IDs for EKS"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS Cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for EKS Node Group"
  type        = string
}
