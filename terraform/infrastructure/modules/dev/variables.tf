variable "project" {
  description = "Name of the project."
}

variable "stack" {
  description = "Name of the stack."
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
}

variable "blue_green" {
  description = "enable or disable blue green deployment"
}

variable "aws_region" {
  description = "name of aws region"
}

variable "fargate-task-service-role" {
  default = ""
}

variable "stage" {}
