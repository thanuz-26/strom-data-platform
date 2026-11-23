locals {
  bq_datasets = {
    raw     = "Raw layer: API data loaded as-is from the data lake bucket"
    staging = "Staging layer: cleaned and typed data, built by dbt"
    marts   = "Marts layer: business-ready fact and dimension tables for Power BI"
  }
}

resource "google_bigquery_dataset" "layers" {
  for_each = local.bq_datasets

  dataset_id  = each.key
  description = each.value
  location    = var.location

  delete_contents_on_destroy = false

  labels = {
    project    = "strom"
    layer      = each.key
    managed_by = "terraform"
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [google_project_service.apis]
}