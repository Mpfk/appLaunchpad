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