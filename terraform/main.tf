provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "global/s3/terraform.tfstate"
    region = "us-east-1"

    dynamodb_table = "your-terraform-locks"
    encrypt        = true
  }
}

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  aws_region   = var.aws_region
  vpc_cidr     = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "eks" {
  source = "./modules/eks"

  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  eks_cluster_name  = var.eks_cluster_name
}

module "rds" {
  source = "./modules/rds"

  project_name          = var.project_name
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  db_instance_class     = var.db_instance_class
  db_allocated_storage  = var.db_allocated_storage
  db_engine             = var.db_engine
  db_engine_version     = var.db_engine_version
  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
}

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  repository_names = var.repository_names
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "s3" {
  source = "./modules/s3"

  project_name = var.project_name
}
