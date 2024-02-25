output "instance-id" {
  value = ec2_instance.id
}

output "tags" {
  value = ec2_instance.tags
}

output "tags_all" {
    value = ec2_instance.tags_all
}