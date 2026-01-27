# Terraform variables for the bootstrap resources
variable "state_bucket_name" {
  description = "Globally unique S3 bucket name for Terraform state"
  type        = string
}

# DynamoDB table name for Terraform state locking
variable "lock_table_name" {
  description = "DynamoDB table name for Terraform state locking"
  type        = string
 
}
