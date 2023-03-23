/******************************************
	VPC configuration
 *****************************************/

resource "google_compute_network" "vpc" {
  name                            = "${var.name_prefix}-vpc-network"
  project                         = var.project_id
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  description                     = var.description
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

/******************************************
	Routes Configuration
 *****************************************/

resource "google_compute_router" "vpc_router" {
  name    = "${var.name_prefix}-router"
  project = var.project_id
  network = google_compute_network.vpc.self_link
}

/******************************************
	Public Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "vpc_subnetwork_public" {
  name                     = "${var.name_prefix}-public-subnet"
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  project                  = var.project_id
  private_ip_google_access = var.private_ip_google_access
  ip_cidr_range            = var.public_ip_cidr_range
  secondary_ip_range {
    range_name    = var.public_secondary_ip_range_name
    ip_cidr_range = var.public_secondary_ip_range
  }

  #   log_config {
  #     enable =  false
  #   }
}

/******************************************
	Public Subnet NAT configuration
 *****************************************/

resource "google_compute_address" "nat_address" {
  name   = "${var.name_prefix}-static-nat-ip"
  region = var.region
}

resource "google_compute_router_nat" "vpc_nat" {
  name                               = "${var.name_prefix}-nat"
  project                            = var.project_id
  region                             = var.region
  router                             = google_compute_router.vpc_router.name
  nat_ips                            = [google_compute_address.nat_address.self_link]
  nat_ip_allocate_option             = "MANUAL_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.vpc_subnetwork_public.self_link
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  depends_on = [var.module_depends_on]
}

/******************************************
	Private Subnet configuration
 *****************************************/
resource "google_compute_subnetwork" "vpc_subnetwork_private" {
  name                     = "${var.name_prefix}-private-subnet"
  region                   = var.region
  network                  = google_compute_network.vpc.self_link
  project                  = var.project_id
  private_ip_google_access = var.private_ip_google_access
  ip_cidr_range            = var.private_ip_cidr_range
  secondary_ip_range {
    range_name    = var.private_secondary_ip_range_name
    ip_cidr_range = var.private_secondary_ip_range
  }

  #   log_config {
  #     enable =  false
  #   }
}

