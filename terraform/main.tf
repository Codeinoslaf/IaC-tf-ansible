terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.196"
    }
  }
}

provider "yandex" {
  zone = var.zone
}

module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  zone         = var.zone
}

module "compute" {
  source = "./modules/compute"

  project_name = var.project_name
  environment  = var.environment
  zone         = var.zone
  subnet_id    = module.vpc.subnet_id
  sg_id        = module.vpc.sg_id
  ssh_key_path = var.ssh_public_key_path
}
