# Output VPC ID and Public Subnet IDs
output "vpc_id" {
  value = aws_vpc.this.id
}
# Output public subnet IDs
output "public_subnet_ids" {
  value = aws_subnet.public.id
}
