
variable "my_ip" {
  description = "Your public IP in CIDR format"
}

variable "app_bucket_name" {
  description = "S3 bucket name for storage module"
  default     = "samuel-app-storage-2025"
}
variable "project_name" {
  description = "Name of the project (used for resource naming and tagging)"
  type        = string
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "owner" {
  description = "Owner/team responsible for the infrastructure"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}
