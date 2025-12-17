variable "ami_id" {
  description = "Amazon Linux 2 AMI ID"
}

variable "subnet_id" {
  description = "Subnet ID to launch EC2"

}

variable "security_group_id" {
  description = "Security Group ID for EC2"
}

variable "key_name" {
  description = "SSH key name for EC2"
  default     = "my-key-pair"  # Replace with your existing key pair
}
