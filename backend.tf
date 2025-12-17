terraform {
  backend "s3" {
    bucket         = "samuel-terraform-state-2025"
    key            = "terraform/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_version = ">= 1.5.0"
}
