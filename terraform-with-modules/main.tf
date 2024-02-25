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

module "xpe-ec2-sg" {
  source = "./modules/sg"
  vpc_id = var.vpc_id
}

module "xpe-ec2-instance" {
  source = "./modules/ec2"
  key_name = var.key_name
  image_id = var.image_id
  tags_propagation = var.tags_propagation
  sg_id = "${xpe-ec2-sg.sg-id}"
}

module "xpe-ec2_instance2" {
  source = "./modules/ec2"
  key_name = var.key_name
  image_id = var.image_id
  tags_propagation = var.tags_propagation
  sg_id = "${xpe-ec2-sg.sg-id}"
}