# Terraform outputs for AWS infrastructure deployment
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.public_subnet_id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = module.security.sg_id
}

output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = module.compute.ec2_instance_id
}

output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.compute.ec2_public_ip
}
