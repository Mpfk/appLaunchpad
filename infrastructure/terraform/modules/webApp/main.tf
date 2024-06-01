# This Terraform module defines the infrastructure for a web application.
# It creates an AWS CodeCommit repository, initializes it with an initial commit,
# and deploys the application using AWS Amplify.

# Randomly generated string used as a suffix for the repository name
resource "random_string" "repository_suffix" {
  length  = 8
  special = false
  upper   = false
}

# AWS CodeCommit repository for the web application
resource "aws_codecommit_repository" "this" {
  repository_name = "${var.project_name}-${random_string.repository_suffix.result}"
  description     = var.description
  tags            = var.tags

  default_branch  = var.default_branch
}

# Output the HTTP clone URL of the CodeCommit repository
output "repository_clone_url_http" {
  value = aws_codecommit_repository.this.clone_url_http
}

# Output the SSH clone URL of the CodeCommit repository
output "repository_clone_url_ssh" {
  value = aws_codecommit_repository.this.clone_url_ssh
}

# Output the name of the CodeCommit repository
output "repository_name" {
  value = aws_codecommit_repository.this.repository_name
}

# Initialize the CodeCommit repository with an initial commit
resource "null_resource" "initialize_repository" {
  provisioner "local-exec" {
    command = <<EOT
      if [ ! -d .git ]; then
        git init
        git remote add origin ${aws_codecommit_repository.this.clone_url_http}
        git add .
        git commit -m "Initial commit"
        git push -u origin main
      fi
    EOT
    working_dir = "${path.module}/../../../applications/webApp"
    environment = {
      GIT_COMMITTER_NAME  = "terraform"
      GIT_COMMITTER_EMAIL = "terraform@example.com"
    }
  }

  depends_on = [aws_codecommit_repository.this]
}

# AWS Amplify application for the web application
resource "aws_amplify_app" "this" {
  name                = var.project_name
  repository          = aws_codecommit_repository.this.clone_url_http
  oauth_token         = var.oauth_token
  environment_variables = var.amplify_environment_variables

  build_spec          = file("${path.module}/../../../applications/webApp/buildspec.yml")

  depends_on = [null_resource.initialize_repository]
}

# Output the default domain URL of the Amplify application
output "amplify_app_url" {
  value = aws_amplify_app.this.default_domain
}