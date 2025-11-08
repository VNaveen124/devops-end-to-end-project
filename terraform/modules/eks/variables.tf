variable "project_name" {
  description = "The name of the project."
}

variable "vpc_id" {
  description = "The ID of the VPC."
}

variable "private_subnet_ids" {
  description = "The IDs of the private subnets."
  type        = list(string)
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
}
