locals {
  common_labels = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

/******************************************
	Module VPC and Subnets configuration
 *****************************************/
module "private_vpc" {
  source                     = "./modules/vpc-network"
  name_prefix                = "${var.name_prefix}-${var.environment}"
  project_id                 = var.project_id
  region                     = var.region
  public_ip_cidr_range       = var.public_ip_cidr_range
  public_secondary_ip_range  = var.public_secondary_ip_range
  private_ip_cidr_range      = var.private_ip_cidr_range
  private_secondary_ip_range = var.private_secondary_ip_range
}

/******************************************
	Module Remote state file configuration
 *****************************************/
module "remote_state" {
  source              = "./modules/remote-state"
  name_prefix         = "${var.name_prefix}-tfstate-bucket-${var.environment}"
  location            = var.region
  project_id          = var.project_id
  backend_output_path = "${path.module}/backend.tf"
  labels              = local.common_labels
}