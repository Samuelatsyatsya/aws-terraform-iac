# Infrastructure as Code (IaC) with Terraform – AWS

## Project Overview

This project demonstrates the use of Terraform to provision and manage foundational AWS infrastructure using Infrastructure as Code (IaC) principles.

It includes a remote backend configuration using Amazon S3 for state storage and DynamoDB for state locking, following industry best practices.

The infrastructure is modular, parameterized via variables, and suitable for AWS Free Tier usage.

---

## Objective

- Provision foundational AWS infrastructure using Terraform
- Configure a remote Terraform backend with:
  - Amazon S3 (state storage)
  - DynamoDB (state locking)
- Follow Terraform and AWS best practices
- Demonstrate a successful create, verify, and destroy lifecycle

---

## Architecture Components

### Networking
- VPC
- Single public subnet (single AZ)
- Internet Gateway
- Public route table with route to IGW

### Security
- Security Group
  - SSH (port 22) allowed only from your public IP (dynamically detected by Terraform)
  - HTTP (port 80) allowed from 0.0.0.0/0

### Compute
- EC2 instance
  - Instance type: t2.micro
  - Amazon Linux AMI
  - Deployed in the public subnet

### Terraform Backend
- S3 bucket for Terraform state
- DynamoDB table for state locking (mandatory)

---

## Project Structure

```text 
.
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── backend.tf
├── modules/
│   ├── networking/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── screenshots/
    ├── terraform-plan.png
    ├── terraform-apply.png
    ├── terraform-destroy.png
    ├── ec2-console.png
    └── backend-proof.png
```

## Prerequisites

#### AWS account (Free Tier or sandbox)

#### Terraform v1.5 or later

#### AWS CLI installed and configured

```bash 
aws configure
terraform version
```
## Terraform Backend Configuration

- Terraform state is stored remotely using:

- Amazon S3 for state file storage

- DynamoDB for state locking and concurrency protection

#### This ensures:

- Safe collaboration

- No local state files

- Protection against concurrent runs

## How to Run
Copy terraform.tfvars.example to terraform.tfvars and fill in your own values:

cp terraform.tfvars.example terraform.tfvars


### Initialize Terraform
```bash
terraform init
```
Initializes providers, modules, and the remote backend.


### Review the Execution Plan
```bash
terraform plan
```
Confirms the resources to be created and verifies that there are no unexpected changes.


### Apply the Infrastructure
```bash
terraform apply
```
Creates all AWS resources and outputs resource IDs and the EC2 public IP.

### Verify Resources

Verify the following in the AWS Console:

- VPC

- Subnet

- Security Group

- EC2 instance

Validation checks:

- SSH access is restricted to your IP

- HTTP is publicly accessible

## Destroy Infrastructure
```bash
terraform destroy
```
Cleans up all AWS resources and prevents unnecessary charges.

### Outputs

Terraform exposes the following outputs:

- VPC ID

- Public Subnet ID

- Security Group ID

- EC2 Instance ID

- EC2 Public IP

These outputs are used for validation and verification.

## Best Practices Applied

-  Modular Terraform design

-  Remote backend with state locking

- No hardcoded values (variables and tfvars)

- Dynamic detection of public IP for SSH access

- Least-privilege security group rules

- Clean create and destroy lifecycle

## Deliverables

#### Terraform .tf files

Screenshots of:

- terraform plan

- terraform apply

- terraform destroy

- AWS EC2 Console

- S3 backend and DynamoDB lock table

- GitHub repository with full source code

## Tools Used

- Terraform v1.5 or later

- AWS (EC2, VPC, S3, DynamoDB)

- AWS CLI

<p align="center">
  <sub>Made with ❤️ by Sam</sub>
</p>
