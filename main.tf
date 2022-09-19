module "s3_bucket" {
  source = "./modules/s3"
  bucket = var.bucket
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "samrdaymond_wa_vpc"
  vpc_cidr = "10.0.0.0/24"  
}

module "ecr" {
  source = "./modules/ecr"
}