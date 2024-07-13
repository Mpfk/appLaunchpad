# appLaunchpad

appLaunchpad is a Terraform project designed to deploy a web application infrastructure on AWS. It utilizes AWS CodeCommit for source control and AWS Amplify for application deployment.

## Table of Contents

- [Directory Structure](#directory-structure)
- [Configure AWS Credentials](#configure-aws-credentials)
- [Prerequisites](#prerequisites)
- [Deployment](#deployment)
- [Clean up](#clean-up)
- [Variables](#variables)
- [Outputs](#outputs)

## Directory Structure

The project is structured is as follows:

```
.
├── applications/
│   └── webApp/
│       ├── index.html
│       └── README.md
├── infrastructure/
│   ├── main.tf
│   ├── modules/
│   │   └── webApp/
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── variables.tf
├── .gitignore
├── LICENSE
└── README.md (this file)
```

## Prerequisites

Before getting started with the deployment, make sure you have the following prerequisites:

- An AWS account with appropriate permissions to create resources.
- AWS CLI installed on your local machine.
- Terraform installed on your local machine.
- Git installed on your local machine.

## Configure AWS Credentials

Before applying changes to the infrastructure, ensure you are logged in to the AWS Command Line Interface (CLI) with the correct profile. 

```sh
aws configure
```

### IAM Identity Center (SSO)

If you want to connect to an AWS Organization through IAM Identity Center, use:

```sh
aws sso configure
```

If your temporary credentials have expired, use the following to log back in:

```sh
aws sso login --profile <profile_name>
```

## Deployment

To deploy the infrastructure, follow these steps:

1. Clone this repository.

2. Initialize Terraform:

```sh
cd infrastructure/
terraform init
```

3. Plan the deployment to review the changes, capturing variables in a `terraform.tfplan` file:

```sh
terraform plan -out=terraform.tfplan
```

4. Apply the changes to deploy the infrastructure:

```sh
terraform apply "terraform.tfplan"
```

## Clean up

If you want to permanently delete the resources created by appLaunchpad, destroy the deployed infrastructure with the following command:

```sh
terraform destroy "terraform.tfplan"
```

## Variables

The following variables are required:

- [`aws_region`]: The AWS region to deploy resources in.
- [`aws_profile`]: The AWS CLI profile to use.
- [`project`]: The project name to use as a prefix for resource names.

While these variables are optional:

- ['custom_domain']: Creates a Hosted Zone in Route 53 and configuration in Amplify (DEFAULT: `NULL`).
- ['prod_subdomain']: The subdomain for the production branch (DEFAULT: `NULL`).
- ['dev_subdomain']: The subdomain for the development branch (DEFAULT: `dev`).

## Outputs

The project generates the following outputs:

- `repository_url`: The URL of the CodeCommit repository.
- `amplify_app_id`: The ID of the Amplify app.