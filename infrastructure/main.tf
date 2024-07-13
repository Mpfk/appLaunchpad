provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "webApp" {
  source        = "./modules/webApp"
  aws_region    = var.aws_region
  aws_profile   = var.aws_profile
  project       = var.project
  custom_domain = var.custom_domain
  prod_subdomain = var.prod_subdomain
  dev_subdomain  = var.dev_subdomain
}