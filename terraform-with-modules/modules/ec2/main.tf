resource "aws_instance" "xpe-ec2-tf-instance" {
  ami = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = ["${var.sg_id}"]

  tags = {
    Name = "ec2-instance-terraform"
    Shutdown = var.shutdown
  }
  tags_all = var.tags_propagation
}

resource "aws_eip" "xpe-ec2-tf-eip" {
  instance = aws_instance.xpe-ec2-tf-instance.id
  tags = {
    Name = "ec2-eip-terraform-with-outputs"
    Course = "XPe AWS"
  }
}