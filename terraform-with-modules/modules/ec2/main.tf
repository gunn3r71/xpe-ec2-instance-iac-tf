resource "aws_instance" "xpe-ec2-tf-instance" {
  ami = var.imageId
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = ["${module.xpe-ec2-sg.sg-id}"]

  tags = {
    Name = "ec2-instance-terraform"
    Shutdown = var.shutdown
  }
}

resource "aws_eip" "xpe-ec2-tf-eip" {
  instance = aws_instance.xpe-ec2-tf-instance.id
  tags = {
    Name = "ec2-eip-terraform-with-outputs"
    Course = "XPe AWS"
  }
}

module "xpe-ec2-sg" {
  source = "../sg"
  vpc_id = var.vpc_id
}