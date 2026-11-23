output "raw_bucket_name" {
  description = "Name of the data lake bucket for raw API files"
  value       = google_storage_bucket.raw.name
}

output "bigquery_datasets" {
  description = "BigQuery dataset IDs per layer"
  value       = { for k, ds in google_bigquery_dataset.layers : k => ds.dataset_id }
}

output "location" {
  description = "Region where the bucket and datasets live"
  value       = var.location
}