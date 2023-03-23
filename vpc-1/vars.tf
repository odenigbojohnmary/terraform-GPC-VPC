/******************************************
	Common Variables
 *****************************************/

variable "project_name" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}

variable "environment" {
	description = "The environment name where the resources is going to be provisioned. eg: Development, Staging or Production"
	type = string
}

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
	type =  string
}

/******************************************
	Public Subnet variables
 *****************************************/

variable "public_ip_cidr_range" {
  description = "This gives the CIDR range of IP for the public subnet"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_secondary_ip_range_name" {
  description = "The name for the secondary IP ranges"
  type        = string
  default     = "public-servers"
}

variable "public_secondary_ip_range" {
  description = "The CIDR range for secondary IP of the public subnet"
  type        = string
  default     = "10.11.0.0/20"
}

/******************************************
	Private Subnet Variables
 *****************************************/
variable "private_ip_cidr_range" {
  description = "This gives the CIDR range of IP for the private subnet"
  type        = string
  default     = "10.12.0.0/16"
}

variable "private_secondary_ip_range_name" {
  description = "The name for the secondary IP ranges"
  type        = string
  default     = "private-servers"
}

variable "private_secondary_ip_range" {
  description = "The CIDR range for secondary IP of the private subnet"
  type        = string
  default     = "10.13.0.0/20"
}
