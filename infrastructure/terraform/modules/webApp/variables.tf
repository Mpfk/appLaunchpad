/**
 * This file contains the variable declarations for the webApp module.
 * It defines the input variables that can be configured when using the module.
 */

/**
 * The name of the project, used as a prefix for resource names.
 *
 * @description The name of the project should be unique and descriptive.
 * @type        string
 */

variable "project_name" {
  description = "The name of the project, used as a prefix for resource names"
  type        = string
}

/**
 * The AWS region to create the resources in.
 *
 * @description The AWS region where the resources will be provisioned.
 * @type        string
 */

variable "region" {
  description = "The AWS region to create the resources in"
  type        = string
}

/**
 * The description of the CodeCommit repository.
 *
 * @description The description provides additional information about the repository.
 * @type        string
 * @default     "Repository for Project UI"
 */

variable "description" {
  description = "The description of the CodeCommit repository"
  type        = string
  default     = "Repository for Project UI"
}

/**
 * The default branch of the CodeCommit repository.
 *
 * @description The default branch is the branch that is checked out by default when cloning the repository.
 * @type        string
 * @default     "main"
 */

variable "default_branch" {
  description = "The default branch of the CodeCommit repository"
  type        = string
  default     = "main"
}

/**
 * Tags to apply to the CodeCommit repository.
 *
 * @description Tags provide metadata to resources for organization and identification purposes.
 * @type        map(string)
 * @default     {}
 */

variable "tags" {
  description = "Tags to apply to the CodeCommit repository"
  type        = map(string)
  default     = {}
}

/**
 * Environment variables for the Amplify app.
 *
 * @description Environment variables can be used to configure the behavior of the Amplify app.
 * @type        map(string)
 * @default     {}
 */

variable "amplify_environment_variables" {
  description = "Environment variables for the Amplify app"
  type        = map(string)
  default     = {}
}