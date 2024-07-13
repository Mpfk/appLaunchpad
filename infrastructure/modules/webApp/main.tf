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

    provisioner "local-exec" {
    when    = create
    command = <<-EOT
      cd ../applications/webApp/
      git checkout -b dev
      AWS_PROFILE=${var.aws_profile} git push -u origin dev
    EOT
  }
}

resource "aws_iam_policy" "amplify_codecommit_access" {
  name        = "${var.project}-amplify-codecommit-access"
  description = "Policy for Amplify to access CodeCommit repository"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "codecommit:GitPull",
        ]
        Effect   = "Allow"
        Resource = aws_codecommit_repository.repo.arn
      },
    ]
  })
}

resource "aws_iam_role" "amplify_access_role" {
  name = "${var.project}-amplify-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "amplify.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "amplify_codecommit_attach" {
  role       = aws_iam_role.amplify_access_role.name
  policy_arn = aws_iam_policy.amplify_codecommit_access.arn
}

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

resource "aws_route53_zone" "main" {
  count = var.custom_domain != "" ? 1 : 0

  name = var.custom_domain
}

resource "aws_amplify_domain_association" "custom_domain_association" {
  count = var.custom_domain != "" ? 1 : 0

  app_id = aws_amplify_app.web_app.id
  domain_name = var.custom_domain

  sub_domain {
    branch_name = aws_amplify_branch.prod_branch.branch_name
    prefix      = var.prod_subdomain
  }

  sub_domain {
    branch_name = aws_amplify_branch.dev_branch.branch_name
    prefix      = var.dev_subdomain
  }

  depends_on = [aws_route53_zone.main]
}