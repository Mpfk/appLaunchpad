# Terraform Module: webApp

This module creates an AWS CodeCommit repository and an AWS Amplify App using the CodeCommit repository as the source.

## Inputs

| Name                              | Description                                      | Type        | Default                 | Required |
|-----------------------------------|--------------------------------------------------|-------------|-------------------------|----------|
| `project_name`                    | The name of the project, used as a prefix for resource names | string      | n/a                     | yes      |
| `region`                          | The AWS region to create the resources in        | string      | n/a                     | yes      |
| `description`                     | The description of the CodeCommit repository     | string      | "Repository for Project UI" | no       |
| `default_branch`                  | The default branch of the CodeCommit repository  | string      | "main"                  | no       |
| `tags`                            | Tags to apply to the CodeCommit repository       | map(string) | {}                      | no       |
| `oauth_token`                     | The OAuth token for Amplify                      | string      | ""                      | yes      |
| `amplify_environment_variables`   | Environment variables for the Amplify app        | map(string) | {}                      | no       |

## Outputs

| Name                     | Description                                 |
|--------------------------|---------------------------------------------|
| `repository_clone_url_http` | The HTTP clone URL of the CodeCommit repository |
| `repository_clone_url_ssh`  | The SSH clone URL of the CodeCommit repository  |
| `repository_name`           | The name of the CodeCommit repository            |
| `amplify_app_url`           | The URL of the Amplify app                       |