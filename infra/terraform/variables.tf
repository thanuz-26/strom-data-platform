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
  description = "Region for the bucket and BigQuery datasets (us-central1 is free-tier eligible for Cloud Storage)"
  type        = string
  default     = "us-central1"
}