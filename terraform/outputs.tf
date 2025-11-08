output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_ca_certificate" {
  description = "The CA certificate for the EKS cluster."
  value       = module.eks.cluster_ca_certificate
}

output "rds_instance_address" {
  description = "The address of the RDS instance."
  value       = module.rds.db_instance_address
}

output "ecr_repository_urls" {
  description = "The URLs of the ECR repositories."
  value       = module.ecr.repository_urls
}
