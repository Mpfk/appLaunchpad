# This file contains the variable declarations for the Terraform configuration.

# The `region` variable specifies the AWS region where the resources will be created.
variable "region" {
  description = "The AWS region to create the resources in"
  type        = string
  default     = "us-east-1"
}

# The `project_name` variable specifies the name of the project, which will be used as a prefix for resource names.
variable "project_name" {
  description = "The name of the project, used as a prefix for resource names"
  type        = string
}

# The `description` variable specifies the description of the CodeCommit repository.
variable "description" {
  description = "The description of the CodeCommit repository"
  type        = string
  default     = "Repository for Project UI"
}

# The `default_branch` variable specifies the default branch of the CodeCommit repository.
variable "default_branch" {
  description = "The default branch of the CodeCommit repository"
  type        = string
  default     = "main"
}

# The `tags` variable specifies the tags to apply to the resources.
variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
}

# The `oauth_token` variable specifies the OAuth token for Amplify.
variable "oauth_token" {
  description = "The OAuth token for Amplify"
  type        = string
  default     = ""
}

# The `amplify_environment_variables` variable specifies the environment variables for the Amplify app.
variable "amplify_environment_variables" {
  description = "Environment variables for the Amplify app"
  type        = map(string)
  default     = {}
}