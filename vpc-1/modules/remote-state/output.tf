output "bucket_name" {
  value       = google_storage_bucket.terraform_state.name
  description = ""
}

output "prefix" {
  description = ""
  value       = var.prefix
}

output "bucket_url" {
  description = ""
  value       = google_storage_bucket.terraform_state.url
}