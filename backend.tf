terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-s3"
    key            = "terraform/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks" #deprecated; may change in coming updates
    encrypt        = true
  }

  required_version = ">= 1.5.0"
}
