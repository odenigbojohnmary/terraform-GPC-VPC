/******************************************
	General variables (REQUIRED)
 *****************************************/
variable "name_prefix" {
  description = "The name to be prefixed to all the resources that will be created"
  type        = string
}

variable "project_id" {
  description = "The GCP project ID where the resources will be created"
  type        = string
}

variable "region" {
  description = "The GCP region where the resources will be created"
}

/******************************************
	VPC configuration variables
 *****************************************/
variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}

variable "description" {
  type        = string
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  default     = ""
}

variable "delete_default_routes_on_create" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}

/******************************************
	Public Subnet configuration variables
 *****************************************/
variable "private_ip_google_access" {
  description = "This when enabled allows resources in this subnet to access Google API and services with their private ip"
  default     = true
  type        = bool
}

variable "public_ip_cidr_range" {
  description = "This gives the CIDR range of IP for the public subnet"
  type        = string
  default     = "10.160.0.0/16"
}

variable "public_secondary_ip_range_name" {
  description = "The name for the secondary IP ranges"
  type        = string
  default     = "public-servers"
}

variable "public_secondary_ip_range" {
  description = "The CIDR range for secondary IP of the public subnet"
  type        = string
  default     = "10.161.0.0/20"
}

/******************************************
	Public Subnet NAT configuration Variable
 *****************************************/
variable "module_depends_on" {
  description = "List of modules or resources this module depends on."
  type        = list(any)
  default     = []
}

/******************************************
	Private Subnet configuration Variables
 *****************************************/
variable "private_ip_cidr_range" {
  description = "This gives the CIDR range of IP for the private subnet"
  type        = string
  default     = "10.150.0.0/16"
}

variable "private_secondary_ip_range_name" {
  description = "The name for the secondary IP ranges"
  type        = string
  default     = "private-servers"
}

variable "private_secondary_ip_range" {
  description = "The CIDR range for secondary IP of the private subnet"
  type        = string
  default     = "10.151.0.0/20"
}
