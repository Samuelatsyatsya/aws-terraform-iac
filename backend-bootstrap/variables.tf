variable "aws_region" {
  description = "AWS region for backend resources"
  default     = "eu-central-1"
}
variable "bucket_name" {
  description = "Name of S3 bucket for Terraform state"
  default     = "samuel-terraform-state-2025"
}

variable "dynamodb_table_name" {
  description = "Name of DynamoDB table for Terraform state locking"
  default     = "terraform-locks"
}
