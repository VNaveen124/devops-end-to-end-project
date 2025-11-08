variable "aws_region" {
  description = "The AWS region to deploy to."
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project."
  default     = "three-tier-app"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnets" {
  description = "The public subnets for the VPC."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  description = "The private subnets for the VPC."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster."
  default     = "three-tier-app-eks"
}

variable "db_instance_class" {
  description = "The instance class for the RDS database."
  default     = "db.t2.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS database."
  default     = 20
}

variable "db_engine" {
  description = "The database engine for the RDS database."
  default     = "mysql"
}

variable "db_engine_version" {
  description = "The database engine version for the RDS database."
  default     = "8.0"
}

variable "db_name" {
  description = "The name of the RDS database."
  default     = "threetierapp"
}

variable "db_username" {
  description = "The username for the RDS database."
  default     = "admin"
}

variable "db_password" {
  description = "The password for the RDS database."
  sensitive   = true
}

variable "repository_names" {
  description = "A list of ECR repository names to create."
  type        = list(string)
  default     = ["frontend", "backend"]
}
