resource "random_id" "this" {
  byte_length = "10"
}

resource "random_string" "ths" {
  length  = 10
  special = false
  upper   = false
}

locals {
  bucket_name = var.bucket_name == null ? "${var.name_prefix}-${random_id.this.hex}" : var.bucket_name
}

resource "google_storage_bucket" "terraform_state" {
  name          = local.bucket_name
  location      = var.location
  project       = var.project_id
  force_destroy = var.force_destroy
  labels        = var.labels
  versioning {
    enabled = var.enable_versioning
  }
}

data "template_file" "remote_state" {
  template = file("${path.module}/templates/remote_state.tpl")
  vars = {
    bucket_name        = google_storage_bucket.terraform_state.name
    prefix             = var.prefix
    credentials_config = "./key.json"
  }
}

resource "local_file" "remote_state_locks" {
  content  = data.template_file.remote_state.rendered
  filename = var.backend_output_path
}