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

variable "db_instance_class" {
  description = "The instance class for the RDS database."
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS database."
}

variable "db_engine" {
  description = "The database engine for the RDS database."
}

variable "db_engine_version" {
  description = "The database engine version for the RDS database."
}

variable "db_name" {
  description = "The name of the RDS database."
}

variable "db_username" {
  description = "The username for the RDS database."
}

variable "db_password" {
  description = "The password for the RDS database."
  sensitive   = true
}
