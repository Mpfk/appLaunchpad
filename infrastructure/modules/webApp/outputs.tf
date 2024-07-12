output "repository_url" {
  description = "The URL of the CodeCommit repository"
  value       = aws_codecommit_repository.repo.clone_url_http
}

output "amplify_app_id" {
  description = "The ID of the Amplify app"
  value       = aws_amplify_app.web_app.id
}