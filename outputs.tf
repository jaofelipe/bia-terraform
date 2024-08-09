output "instance_id" {
  description = "Id da EC2"
  value = aws_instance.bia-dev.id
}

output "instance_type" {
  description = "Tipo da EC2"
  value = aws_instance.bia-dev.instance_type
}

output "instance_security_groups" {
    description = "SG da EC2"
    value = aws_instance.bia-dev.security_groups
}

output "instance_public_ip" {
    description = "IP publico da EC2"
    value = aws_instance.bia-dev.public_ip
}