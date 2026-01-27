# Output public IP address of the EC2 instance
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.this.public_ip
}

# Output instance ID
output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.this.id
}

# Output key name associated with the EC2 instance
output "key_name" {
  description = "Key name associated with the EC2 instance"
  value       = aws_instance.this.key_name
}