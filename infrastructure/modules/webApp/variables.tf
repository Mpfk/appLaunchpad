variable "aws_region" {
  description = "AWS region to deploy resources..."
  type        = string
}

variable "aws_profile" {
  description = "The AWS CLI profile to use. Run `aws configure` or `aws sso configure` to set up a profile..."
  type        = string
}

variable "project" {
  description = "Name your project..."
  type        = string
}

variable "custom_domain" {
  description = "[OPTIONAL] Use a custom domain for the web application? Leave undefined if not using a custom domain. (example: mywebsite.com)"
  type        = string
}

variable "prod_subdomain" {
  description = "The subdomain for the production branch."
  type        = string
  default = ""
}

variable "dev_subdomain" {
  description = "The subdomain for the development branch."
  type        = string
  default = "dev"
}