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