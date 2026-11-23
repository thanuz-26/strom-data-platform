resource "google_storage_bucket" "raw" {
  name          = "${var.project_id}-raw"
  location      = var.location
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      days_since_noncurrent_time = 30
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    project    = "strom"
    layer      = "raw"
    managed_by = "terraform"
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [google_project_service.apis]
}

resource "google_storage_bucket" "tfstate" {
  name          = "${var.project_id}-tfstate"
  location      = var.location
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = false

  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      num_newer_versions = 20
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    project    = "strom"
    purpose    = "terraform-state"
    managed_by = "terraform"
  }

  lifecycle {
    prevent_destroy = true
  }

  depends_on = [google_project_service.apis]
}