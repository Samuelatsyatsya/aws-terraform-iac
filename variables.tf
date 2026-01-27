# Terraform variables for AWS infrastructure deployment
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}

variable "tags" {
  description = "Default tags"
  type        = map(string)
  default     = {}
}


# NETWORKING CONFIGURATION
variable "networking" {
  description = "Networking configuration"
  type = object({
    vpc_cidr                = string
    enable_dns_hostnames    = bool
    enable_dns_support      = bool
    public_subnet_cidr     = string
    availability_zone      = string
    map_public_ip_on_launch = bool
    public_subnet_tier      = string
    destination_cidr_block  = string
  })
}

# SECURITY GROUP CONFIGURATION
variable "security" {
  description = "Security group configuration"
  type = object({
    name               = string
    description        = string
    ssh_description    = string
    ssh_port           = number
    ssh_protocol       = string
    ssh_cidr_blocks    = list(string)
    http_description   = string
    http_port          = number
    http_protocol      = string
    http_cidr_blocks   = list(string)
    egress_from_port   = number
    egress_to_port     = number
    egress_protocol    = string
    egress_cidr_blocks = list(string)
    tags               = map(string)
  })
}


# COMPUTE CONFIGURATION
variable "compute" {
  description = "EC2 configuration"
  type = object({
    ami_id             = string
    instance_type      = string
    key_name           = string
    associate_public_ip= bool
    project            = string
    tags               = map(string)
  })
}
