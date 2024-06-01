# This file defines the output variables for the webApp module.

# The `repository_clone_url_http` output variable represents the HTTP clone URL of the AWS CodeCommit repository.
output "repository_clone_url_http" {
  value = aws_codecommit_repository.this.clone_url_http
}

# The `repository_clone_url_ssh` output variable represents the SSH clone URL of the AWS CodeCommit repository.
output "repository_clone_url_ssh" {
  value = aws_codecommit_repository.this.clone_url_ssh
}

# The `repository_name` output variable represents the name of the AWS CodeCommit repository.
output "repository_name" {
  value = aws_codecommit_repository.this.repository_name
}

# The `amplify_app_url` output variable represents the default domain URL of the AWS Amplify application.
output "amplify_app_url" {
  value = aws_amplify_app.this.default_domain
}