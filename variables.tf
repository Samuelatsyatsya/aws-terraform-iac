variable "aws_region" {
  default = "eu-central-1"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
}

variable "key_name" {
  description = "EC2 key pair name"
}

variable "my_ip" {
  description = "Your public IP in CIDR format"
}

variable "app_bucket_name" {
  description = "S3 bucket name for storage module"
}
