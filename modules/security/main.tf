# Terraform module to create a security group with specific ingress and egress rules
resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  ingress {
    description = var.ssh_description
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.ssh_protocol
    cidr_blocks = var.ssh_cidr_blocks
  }

  ingress {
    description = var.http_description
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = var.http_protocol
    cidr_blocks = var.http_cidr_blocks
  }

  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
  }

  tags = var.tags
}
