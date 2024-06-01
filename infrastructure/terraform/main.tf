# This Terraform configuration file sets up an AWS provider and deploys a web application using a module.

# Configure the AWS provider with the specified region.
provider "aws" {
  region = var.region
}

# Deploy the web application using the "webApp" module.
module "webApp" {
  source = "./modules/webApp"

  # Input variables for the webApp module.
  project_name                  = var.project_name
  region                        = var.region
  description                   = var.description
  default_branch                = var.default_branch
  tags                          = var.tags
  amplify_environment_variables = var.amplify_environment_variables
}

# Output the clone URL for the web application repository (HTTP).
output "repository_clone_url_http" {
  value = module.webApp.repository_clone_url_http
}

# Output the clone URL for the web application repository (SSH).
output "repository_clone_url_ssh" {
  value = module.webApp.repository_clone_url_ssh
}

# Output the name of the web application repository.
output "repository_name" {
  value = module.webApp.repository_name
}

# Output the URL of the deployed Amplify app.
output "amplify_app_url" {
  value = module.webApp.amplify_app_url
}