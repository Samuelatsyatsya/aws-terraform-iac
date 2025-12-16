terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-12345"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }

  required_version = ">= 1.5.0"
}
