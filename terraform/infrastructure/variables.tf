variable "dev" {
  description = "dev stage configured"
  default = {
    dev = {
      stage = "dev"
      stack = var.stack
      project = var.project
      az_count = var.az_count_dev
      vpc_cidr = var.vpc_cidr_dev
      blue_green = 0
    }
  }
}

variable "prod" {
  description = "prod stage configured"
  type = object({
    stage = string
    stack = string
    project = string
    az_count = string
    vpc_cidr = string
    blue_green = string
  })
  default = {
    prod = {
      stage = "prod"
      stack = var.stack
      project = var.project
      az_count = var.az_count_dev
      vpc_cidr = var.vpc_cidr_dev
      blue_green = 1
    }
  }
}


variable "stack" {
  description = "Name of the stack."
  default = "CloudBootstrap"
}

variable "project" {
  description = "Name of the project."
  default = "cc-cloud-bootstrap"
}

variable "aws_region" {
  description = "The AWS region to create things in."
}

variable "aws_profile" {
  description = "AWS profile"
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

variable "family" {
  description = "Family of the Task Definition"
  default = "cloud-bootstrap"
}

variable "container_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default = 8080
}

variable "task_count" {
  description = "Number of ECS tasks to run"
  default = 3
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default = "1024"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default = "2048"
}

variable "cw_log_group" {
  description = "CloudWatch Log Group"
  default = "CloudBootstrap"
}

variable "cw_log_stream" {
  description = "CloudWatch Log Stream"
  default = "fargate"
}

variable "fargate-task-service-role-dev" {
  description = "Service role name for the dev stage."
}

variable "vpc_cidr_dev" {
  description = "CIDR for the dev VPC"
}

variable "az_count_dev" {
  description = "Number of AZs to cover in a given AWS region for the dev stage"
}

variable "fargate-task-service-role-prod" {
  description = "Service role name for the prod stage."
}

variable "vpc_cidr_prod" {
  description = "CIDR for the prod VPC"
}

variable "az_count_prod" {
  description = "Number of AZs to cover in a given AWS region for the prod stage"
}
