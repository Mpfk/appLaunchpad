/**
 * Outputs
 *
 * This file defines the outputs for the Terraform module. These outputs provide information about the CodeCommit repository and the Amplify app.
 */

output "repository_clone_url_http" {
  description = "The HTTP clone URL of the CodeCommit repository"
  value       = module.webApp.repository_clone_url_http
}

output "repository_clone_url_ssh" {
  description = "The SSH clone URL of the CodeCommit repository"
  value       = module.webApp.repository_clone_url_ssh
}

output "repository_name" {
  description = "The name of the CodeCommit repository"
  value       = module.webApp.repository_name
}

output "amplify_app_url" {
  description = "The URL of the Amplify app"
  value       = module.webApp.amplify_app_url
}