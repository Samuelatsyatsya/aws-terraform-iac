# Terraform outputs for the bootstrap resources
output "state_bucket_name" {
  description = "S3 bucket used for Terraform state"
  value       = aws_s3_bucket.tf_state.bucket
}

