terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.55"
    }
  }
}

provider "aws" {
  region  = "eu-north-1"
  profile = "tf-lesson5"
}

module "s3_backend" {
  source      = "./modules/s3-backend"
  bucket_name = "artem-tfstate-lesson5-314175685469-eun1"
  table_name  = "terraform-locks"
  tags        = { Project = "lesson-5", Owner = "Artem" }
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  vpc_name           = "lesson-5-vpc"
  tags               = { Project = "lesson-5", Owner = "Artem" }
}

module "ecr" {
  source       = "./modules/ecr"
  ecr_name     = "lesson-5-ecr"
  scan_on_push = true
  tags         = { Project = "lesson-5", Owner = "Artem" }
}
