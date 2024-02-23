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
  region = "us-east-1"
}

resource "aws_security_group" "xpe-tf-sg-ec2" {
  name = "xpe-ec2-instance-tf-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-http-rule" {
  type = "igress"
  protocol = "tcp"
  from_port = 80
  to_port = 80
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-https-rule" {
  type = "igress"
  protocol = "tcp"
  from_port = 443
  to_port = 443
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2
}

resource "aws_security_group_rule" "xpe-tf-sg-inbound-ssh-rule" {
  type = "igress"
  protocol = "tcp"
  from_port = 22
  to_port = 22
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2
}

resource "aws_security_group_rule" "xpe-tf-sg-outbound" {
  type = "egress"
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.xpe-tf-sg-ec2
}

resource "aws_instance" "xpe-ec2-tf-instance" {
  ami = var.imageId
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.xpe-tf-sg-ec2 ]

  tags = {
    Name = "ec2-instance-terraform"
    Course = "XPe AWS"
  }
}

resource "aws_eip" "xpe-ec2-tf-eip" {
  instance = aws_instance.xpe-ec2-tf-instance
  tags = {
    Name = "ec2-eip-terraform"
    Course = "XPe AWS"
  }
}
