variable "project" {
  description = "Name of the project."
}

variable "stack" {
  description = "Name of the stack."
}

variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "family" {
  description = "Family of the Task Definition"
}

# Source repo name and branch
variable "source_repo_name" {
  description = "Source repo name"
  type = string
}

variable "source_repo_branch" {
  description = "Source repo branch"
  type = string
}

# Image repo name for ECR
variable "image_repo_name" {
  description = "Image repo name"
  type = string
}

variable "ecs_cluster_name_dev"{}
variable "ecs_service_name_dev"{}
variable "codedeploy_deployment_group_name"{}
variable "codedeploy_application_name"{}
