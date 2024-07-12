# appLaunchpad

appLaunchpad is a Terraform project designed to deploy a web application infrastructure on AWS. It utilizes AWS CodeCommit for source control and AWS Amplify for application deployment.

## Table of Contents

- [Directory Structure](#directory-structure)
- [AWS CLI Login](#aws-cli-login)
- [Terraform Deployment](#terraform-deployment)
- [Clean up](#terraform-destruction)
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

If you don't have any of these prerequisites, please refer to the official documentation for installation instructions.

Once you have all the prerequisites in place, you can proceed with the deployment steps mentioned below.

## AWS CLI Login

Before deploying the infrastructure, ensure you are logged in to the AWS CLI with the correct profile. Use the following command to configure your AWS CLI with the appropriate credentials:

```sh
aws configure
```
Or if connecting to an AWS organziation:

```sh
aws sso configure
```

## Deployment

To deploy the infrastructure, follow these steps:

1. Clone this repository.

2. Initialize Terraform:

```sh
cd infrastructure/
terraform init
```

3. Plan the deployment to review the changes, capturing variables in a `terraform.tfvars` file:

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
terraform destroy
```

## Variables

The following variables are used in the project:

- [`aws_region`]: The AWS region to deploy resources in.
- [`aws_profile`]: The AWS CLI profile to use.
- [`project`]: The project name to use as a prefix for resource names.

## Outputs

The project generates the following outputs:

- `repository_url`: The URL of the CodeCommit repository.
- `amplify_app_id`: The ID of the Amplify app.