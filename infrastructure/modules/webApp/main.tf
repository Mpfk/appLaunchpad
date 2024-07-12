resource "aws_codecommit_repository" "repo" {
  repository_name = "${var.project}-web-app-repo"
  description     = "CodeCommit repository for ${var.project} web application"
  default_branch  = "prod"

  tags = {
    Name            = "${var.project}-web-app-repo"
    "ApplicationID" = var.project
  }
}

resource "null_resource" "push_initial_commit" {
  depends_on = [aws_codecommit_repository.repo]

  triggers = {
    repo_clone_url_http = aws_codecommit_repository.repo.clone_url_http
  }

  provisioner "local-exec" {
    command = <<-EOT
      cd ../applications/webApp/
      git init
      git checkout -b prod
      git add .
      git commit -m "Initial commit"
      git remote add origin ${self.triggers.repo_clone_url_http}
      AWS_PROFILE=${var.aws_profile} git push -u origin prod
    EOT
  }
}

resource "aws_amplify_app" "web_app" {
  name       = "${var.project}-web-app"
  repository = aws_codecommit_repository.repo.clone_url_http

  tags = {
    Name            = "${var.project}-web-app"
    "ApplicationID" = var.project
  }
}

resource "aws_amplify_branch" "prod_branch" {
  app_id      = aws_amplify_app.web_app.id
  branch_name = "prod"
}

