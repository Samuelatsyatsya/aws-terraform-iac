module "network" {
  source = "./modules/networking"
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
  my_ip  = var.my_ip
}

module "compute" {
  source            = "./modules/compute"
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security.sg_id
}

module "storage" {
  source      = "./modules/database"
  bucket_name = var.app_bucket_name
}
