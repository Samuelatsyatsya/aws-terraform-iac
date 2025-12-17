output "ec2_public_ip" {
  value = module.compute.public_ip
}

output "vpc_id" {
  value = module.networking.vpc_id
}

output "storage_bucket" {
  value = module.database.bucket_name
}
