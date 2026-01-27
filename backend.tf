# Configure the S3 backend for Terraform state storage
terraform {
  backend "s3" {
    bucket         = "terraform-state-iac-f3604dbb"
    key            = "terraform/terraform.tfstate"
    region         = "eu-central-1"
    use_lockfile = true

  }
}
