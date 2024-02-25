terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

module "ec2_instance" {
  source = "./modules/ec2"
  key_name = var.key_name
  imageId = var.imageId
  vpc_id = var.vpc_id
  tags_propagation = var.tags_propagation
}

module "ec2_instance2" {
  source = "./modules/ec2"
  key_name = var.key_name
  imageId = var.imageId
  vpc_id = var.vpc_id
  tags_propagation = var.tags_propagation
}