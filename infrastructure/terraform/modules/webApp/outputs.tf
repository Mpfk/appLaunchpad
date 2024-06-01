# This file defines the output variables for the webApp module.

output "webApp_outputs" {
  value = {
    repository_clone_url_http = aws_codecommit_repository.this.clone_url_http
    repository_clone_url_ssh = aws_codecommit_repository.this.clone_url_ssh
    repository_name = aws_codecommit_repository.this.repository_name
    amplify_app_url = aws_amplify_app.this.default_domain
  }
}