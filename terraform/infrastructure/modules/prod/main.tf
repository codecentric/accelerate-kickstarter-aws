
module "network" {
  source = "../network"
  stage = var.stage
  project = var.project
  stack = var.stack
  az_count = var.az_count
  blue_green = var.blue_green
  vpc_cidr = var.vpc_cidr
}

module "compute-prod" {
  source                     = "../compute-prod"
  stage                      = "prod"
  depends_on                 = [module.network.alb_security_group_ids]
  project                    = var.project
  stack                      = var.stack
  aws_region                 = var.aws_region
  image_repo_url             = module.cicd.image_repo_url
  vpc_main_id                = module.network.vpc_main_id
  cw_log_group               = "${var.project}-prod"
  fargate-task-service-role  = var.fargate-task-service-role
  aws_alb_listener_arn       = module.network.alb_listener_arn
  aws_alb_security_group_ids = module.network.alb_security_group_ids
  aws_alb_trgp_blue_id       = module.network.alb_target_group_blue_id
  aws_alb_trgp_blue_name     = module.network.alb_target_group_blue_name
  aws_alb_trgp_green_id      = module.network.alb_target_group_green_id
  aws_alb_trgp_green_name    = module.network.alb_target_group_green_name
  aws_private_subnet_ids     = module.network.vpc_private_subnet_ids
}
