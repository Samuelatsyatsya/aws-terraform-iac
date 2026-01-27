# AWS PROVIDER CONFIGURATION
provider "aws" {
  region = var.region
}

# Dynamically get public IP
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com/"
}

locals {
  my_public_ip_cidr = "${chomp(data.http.my_ip.response_body)}/32"
}


# NETWORKING MODULE
module "networking" {
  source                   = "./modules/networking"
  project                  = var.project_name
  vpc_cidr                 = var.networking.vpc_cidr
  public_subnet_cidr       = var.networking.public_subnet_cidr
  availability_zone        = var.networking.availability_zone
  map_public_ip_on_launch  = var.networking.map_public_ip_on_launch
  tags                     = var.tags
}

# SECURITY GROUP MODULE
module "security" {
  source = "./modules/security"

  vpc_id              = module.networking.vpc_id

  sg_name             = var.security.name
  sg_description      = var.security.description

  ssh_description     = var.security.ssh_description
  ssh_port            = var.security.ssh_port
  ssh_protocol        = var.security.ssh_protocol
  ssh_cidr_blocks     = [local.my_public_ip_cidr] 

  http_description    = var.security.http_description
  http_port           = var.security.http_port
  http_protocol       = var.security.http_protocol
  http_cidr_blocks    = var.security.http_cidr_blocks

  egress_from_port    = var.security.egress_from_port
  egress_to_port      = var.security.egress_to_port
  egress_protocol     = var.security.egress_protocol
  egress_cidr_blocks  = var.security.egress_cidr_blocks

  tags                = var.security.tags
}


# COMPUTE MODULE
module "compute" {
  source = "./modules/compute"

  # EC2 Configuration
  ami_id             = var.compute.ami_id
  instance_type      = var.compute.instance_type
  subnet_id          = module.networking.public_subnet_id     
  security_group_ids = [module.security.sg_id]           
  key_name           = var.compute.key_name
  associate_public_ip= var.compute.associate_public_ip

  project = var.project_name
  tags    = var.tags
}
