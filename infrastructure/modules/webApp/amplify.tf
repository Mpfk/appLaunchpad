resource "aws_amplify_app" "web_app" {
  name       = "${var.project}-web-app"
  repository = aws_codecommit_repository.repo.clone_url_http
  iam_service_role_arn = aws_iam_role.amplify_access_role.arn
  tags = {
    Name            = "${var.project}-web-app"
    "ApplicationID" = var.project
  }
}

resource "aws_amplify_branch" "prod_branch" {
  app_id      = aws_amplify_app.web_app.id
  branch_name = "prod"
}

resource "aws_amplify_branch" "dev_branch" {
  app_id      = aws_amplify_app.web_app.id
  branch_name = "dev"
}