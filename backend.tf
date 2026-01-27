# Configure the S3 backend for Terraform state storage
terraform {
  backend "s3" {
    bucket         = "iac-terraform-state"
    key            = "terraform/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "iac-terraform-locks"
    encrypt        = true
  }
}
