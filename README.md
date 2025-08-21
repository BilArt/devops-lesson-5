# DevOps Lesson 5 — Terraform IaC on AWS

This project is part of the **DevOps course (Lesson 5)** and demonstrates the use of **Terraform** to provision AWS resources following Infrastructure as Code (IaC) principles.

## Overview
The project provisions:
- VPC with public and private subnets
- Internet Gateway & NAT Gateway
- Route Tables
- S3 bucket for Terraform state
- DynamoDB table for state locking
- ECR repository for container images

Terraform state is stored in a remote backend (S3 + DynamoDB) to ensure consistency in collaborative environments.

## Architecture

  AWS
   ├── VPC (10.0.0.0/16)
   │    ├── Public Subnets
   │    ├── Private Subnets
   │    ├── Internet Gateway
   │    ├── NAT Gateway
   │    └── Route Tables
   ├── S3 Bucket (Terraform state)
   ├── DynamoDB Table (State Locking)
   └── ECR Repository

## Usage

1. Clone the repo
   git clone https://github.com/BilArt/devops-lesson-5.git
   cd devops-lesson-5

2. Deploy the S3 backend
   mv backend.tf backend.tf.off
   terraform init -backend=false
   terraform apply -target=module.s3_backend -auto-approve

3. Enable remote backend
   mv backend.tf.off backend.tf
   terraform init -migrate-state
   # Enter "yes" when prompted to migrate state.

4. Deploy full infrastructure
   terraform apply -auto-approve

## Cleanup

To remove everything:
   terraform destroy -auto-approve

If Terraform cannot destroy some dependencies (e.g. NAT, routes, IGW), use the cleanup script or AWS CLI.

## Notes
- Terraform version: v1.12.2+
- AWS Provider: v5.100.0
- Region: eu-north-1 (Stockholm)
- AWS CLI profile: tf-lesson5
