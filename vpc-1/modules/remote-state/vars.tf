variable "bucket_name" {
  description = ""
  type        = string
  default     = null
}

variable "project_id" {
  description = "The GCP project ID where the resources will be created"
  type        = string
}

variable "location" {
  description = ""
  type        = string
  default     = "europe-west2"
}

variable "force_destroy" {
  description = ""
  type        = bool
  default     = false
}

variable "labels" {
  description = ""
  default     = null
}

variable "enable_versioning" {
  description = ""
  type        = bool
  default     = true
}

variable "prefix" {
  description = ""
  type        = string
  default     = "dev/terraform.tfstate"
}

variable "backend_output_path" {
  description = ""
  type        = string
  default     = "./backend.tf"
}

variable "name_prefix" {

}