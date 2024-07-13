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
      git branch | grep "prod" || git checkout -b prod
      git remote remove origin || true
      git remote add origin ${self.triggers.repo_clone_url_http}
      git add .
      git commit -m "Initial commit" || true
      AWS_PROFILE=${var.aws_profile} git push -u origin prod
    EOT
  }
  provisioner "local-exec" {
    when    = create
    command = <<-EOT
      cd ../applications/webApp/
      git checkout -b dev || git checkout dev
      AWS_PROFILE=${var.aws_profile} git push -u origin dev
    EOT
  }
}