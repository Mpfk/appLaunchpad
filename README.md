# appLaunchpad

This Terraform configuration sets up an AWS CodeCommit repository and an AWS Amplify App using the CodeCommit repository as the source. Get building faster!

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured with necessary permissions
- An OAuth token for Amplify (required for setting up the Amplify app)

## Usage

### Open terminal in main folder

```bash
cd infrastructure/terraform
```

### Initialize Terraform

```bash
terraform init
```

### Plan the deployment

```bash
terraform plan
```

### Apply the deployment

```bash
terraform apply
```

## Deployment Structure

```
project/
├── applications/
│   └── webApp/
│       ├── # Deploy front-end code here
│       ├── package.json
│       └── README.md
├── infrastructure/
│   └── terraform/
│       ├── modules/
│       │   └── webApp/
│       │       ├── main.tf
│       │       ├── variables.tf
│       │       ├── outputs.tf
│       │       └── README.md
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
└── .gitignore
```

## Inputs

| Name                              | Description                                      | Type        | Default                 | Required |
|-----------------------------------|--------------------------------------------------|-------------|-------------------------|----------|
| `project_name`                    | The name of the project, used as a prefix for resource names | string      | n/a                     | yes      |
| `region`                          | The AWS region to create the resources in        | string      | "us-east-1"             | no       |
| `description`                     | The description of the CodeCommit repository     | string      | "Repository for Project UI" | no       |
| `default_branch`                  | The default branch of the CodeCommit repository  | string      | "main"                  | no       |
| `tags`                            | Tags to apply to the resources                   | map(string) | {}                      | no       |
| `amplify_environment_variables`   | Environment variables for the Amplify app        | map(string) | {}                      | no       |

## Outputs

| Name                     | Description                                 |
|--------------------------|---------------------------------------------|
| `repository_clone_url_http` | The HTTP clone URL of the CodeCommit repository |
| `repository_clone_url_ssh`  | The SSH clone URL of the CodeCommit repository  |
| `repository_name`           | The name of the CodeCommit repository            |
| `amplify_app_url`           | The URL of the Amplify app                       |
