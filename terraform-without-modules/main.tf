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

resource "aws_security_group" "xpe-tf-sg-ec2" {
  name = "xpe-ec2-instance-tf-sg-new"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-http-rule" {
  type = "ingress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2.id
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-https-rule" {
  type = "ingress"
  protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2.id
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-ssh-rule" {
  type = "ingress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2.id
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-mongodb-rule" {
  type = "ingress"
  protocol = "tcp"
  from_port = 27017
  to_port = 27017
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2.id
}


resource "aws_security_group_rule" "xpe-tf-sg-outbound" {
  type = "egress"
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2.id
}

resource "aws_instance" "xpe-ec2-tf-instance" {
  ami = var.imageId
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.xpe-tf-sg-ec2.id ]

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
