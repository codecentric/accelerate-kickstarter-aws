# ---------------------------------------------------------------------------------------------------------------------
# AWS PROVIDER FOR TF CLOUD
# ---------------------------------------------------------------------------------------------------------------------
terraform {
  required_version = ">1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"
    }
  }

}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# Shared CI/CD infrastructure
module "cicd" {
  source                           = "./modules/cicd"
  project                          = var.project
  stack                            = var.stack
  aws_region                       = var.aws_region
  image_repo_name                  = var.image_repo_name
  source_repo_branch               = var.source_repo_branch
  source_repo_name                 = var.source_repo_name
  family                           = var.family
  ecs_cluster_name_dev             = module.compute-dev.ecs_cluster_name
  ecs_service_name_dev             = module.compute-dev.ecs_service_name
  codedeploy_application_name      = module.compute-prod.codedeploy_app_name
  codedeploy_deployment_group_name = module.compute-prod.codedeploy_deployment_group_name
}

module "dev-stage" {
  source = "./modules/dev"
  stage = var.dev.stage
  project = var.dev.project
  stack = var.dev.stack
  az_count = var.dev.az_count
  blue_green = var.dev.blue_green
  vpc_cidr = var.dev.vpc_cidr
  aws_region = var.aws_region
  fargate-task-service-role = var.fargate-task-service-role-dev
}


# PROD stage
module "prod-stage" {
  source   = "./modules/prod"
  stage    = var.prod.stage
  project  = var.prod.project
  stack    = var.prod.stack
  az_count = var.prod.az_count
  blue_green = var.prod.blue_green
  vpc_cidr = var.prod.vpc_cidr
  aws_region = var.aws_region
  fargate-task-service-role = var.fargate-task-service-role-prod
}


output "source_repo_clone_url_http" {
  value = module.cicd.source_repo_clone_url_http
}

output "ecs_task_execution_role_arn_dev" {
  value = module.compute-dev.ecs_task_execution_role_arn
}

output "ecs_task_execution_role_arn_prod" {
  value = module.compute-prod.ecs_task_execution_role_arn
}

output "alb_address_dev" {
  value = module.network.alb_address
}

output "alb_address_prod" {
  value = module.network.alb_address
}
