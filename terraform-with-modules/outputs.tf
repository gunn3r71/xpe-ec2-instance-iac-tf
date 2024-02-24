output "instance-id" {
  value = aws_instance.xpe-ec2-tf-instance.id
}

output "subnet-id" {
  value = aws_instance.xpe-ec2-tf-instance.subnet_id
}

output "ip" {
  value = aws_eip.xpe-ec2-tf-eip.address
}