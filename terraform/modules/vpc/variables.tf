variable "project_name" {
  description = "The name of the project."
}

variable "aws_region" {
  description = "The AWS region to deploy to."
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "The public subnets for the VPC."
  type        = list(string)
}

variable "private_subnets" {
  description = "The private subnets for the VPC."
  type        = list(string)
}
