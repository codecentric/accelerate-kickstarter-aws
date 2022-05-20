
module "network" {

  source = "../network"
  stage = var.stage
  project = var.project
  stack = var.stack
  az_count = var.az_count
  blue_green = var.blue_green
  vpc_cidr = var.vpc_cidr
}

module "compute-dev" {
  source                    = "../compute-dev"
  stage                     = "dev"
  // depends_on                = [module.network.alb_security_group_ids]
  project                   = var.project
  stack                     = var.stack
  aws_region                = var.aws_region
  image_repo_url            = module.cicd.image_repo_url
  fargate-task-service-role = var.fargate-task-service-role-dev
  aws_alb_trgp_id           = module.network.alb_target_group_id
  aws_private_subnet_ids    = module.network.vpc_private_subnet_ids
  alb_security_group_ids    = module.network.alb_security_group_ids
  vpc_main_id               = module.network.vpc_main_id
  cw_log_group              = "${var.project}-dev"
}
