# Terraform backend configuration for storing state in S3 and using DynamoDB for state locking

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
# S3 bucket for Terraform state storage
resource "aws_s3_bucket" "tf_state" {
  bucket = "terraform-state-iac-${random_id.bucket_suffix.hex}"
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "terraform-state"
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.tf_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption for the S3 bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.tf_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}