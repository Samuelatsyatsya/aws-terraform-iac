# Terraform module variables for EC2 instance configuration
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# Subnet ID to launch EC2 
variable "subnet_id" {
  description = "Subnet ID to launch EC2 in"
  type        = string
}

# List of security group IDs to attach to EC2
variable "security_group_ids" {
  description = "List of security group IDs to attach to EC2"
  type        = list(string)
}

# AWS key pair name for SSH
variable "key_name" {
  description = "AWS key pair name for SSH"
  type        = string
}

# Assign public IP to the EC2 instance  
variable "associate_public_ip" {
  description = "Assign public IP to the EC2 instance"
  type        = bool
}

# Project name for tagging
variable "project" {
  description = "Project name for tagging"
  type        = string
}

# Additional tags for EC2 instance
variable "tags" {
  description = "Additional tags for EC2 instance"
  type        = map(string)
}
