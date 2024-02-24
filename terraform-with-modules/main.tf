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

resource "aws_instance" "xpe-ec2-tf-instance" {
  ami = var.imageId
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ "${module.xpe-ec2-sg.sg-id}" ]

  tags = {
    Name = "ec2-instance-terraform"
    Course = "XPe AWS"
  }
}

resource "aws_eip" "xpe-ec2-tf-eip" {
  instance = aws_instance.xpe-ec2-tf-instance.id
  tags = {
    Name = "ec2-eip-terraform"
    Course = "XPe AWS"
  }
}

module "xpe-ec2-sg" {
  source = "./modules/sg"
  vpc_id = var.vpc_id
}