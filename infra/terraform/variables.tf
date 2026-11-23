variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Default region for regional resources"
  type        = string
  default     = "us-central1"
}

variable "location" {
  description = "Multi-region location for the bucket and BigQuery datasets (US keeps us in the free tier)"
  type        = string
  default     = "US"
}