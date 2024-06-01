# This file defines the output variables for the Terraform module.

# Output: webapp_repository_clone_url_http
# Description: The HTTP clone URL of the webApp CodeCommit repository
# Value: module.webApp.repository_clone_url_http
output "webapp_repository_clone_url_http" {
  description = "The HTTP clone URL of the webApp CodeCommit repository"
  value       = module.webApp.repository_clone_url_http
}

# Output: webapp_repository_clone_url_ssh
# Description: The SSH clone URL of the webApp CodeCommit repository
# Value: module.webApp.repository_clone_url_ssh
output "webapp_repository_clone_url_ssh" {
  description = "The SSH clone URL of the webApp CodeCommit repository"
  value       = module.webApp.repository_clone_url_ssh
}

# Output: webapp_repository_name
# Description: The name of the webApp CodeCommit repository
# Value: module.webApp.repository_name
output "webapp_repository_name" {
  description = "The name of the webApp CodeCommit repository"
  value       = module.webApp.repository_name
}

# Output: webapp_amplify_app_url
# Description: The URL of the webApp Amplify app
# Value: module.webApp.amplify_app_url
output "webapp_amplify_app_url" {
  description = "The URL of the webApp Amplify app"
  value       = module.webApp.amplify_app_url
}