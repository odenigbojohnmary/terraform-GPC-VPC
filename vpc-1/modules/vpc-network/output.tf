output "vpc_network" {
  description = ""
  value       = google_compute_network.vpc.self_link
}

output "public_subnetnetwork" {
  description = ""
  value       = google_compute_subnetwork.vpc_subnetwork_public.self_link
}

output "public_subnetwork_name" {
  description = ""
  value       = google_compute_subnetwork.vpc_subnetwork_public.name
}

# output "public_subnetework_cidr_block" {

# }