output "instance_id" {
     value = aws_instance.xpe-ec2-tf-instance.id
}

output "tags" {
  value = aws_instance.xpe-ec2-tf-instance.tags
}