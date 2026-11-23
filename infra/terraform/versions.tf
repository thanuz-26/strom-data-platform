terraform {
  required_version = ">= 1.9"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0"
    }
  }

  # Remote state in Cloud Storage (backends cannot use variables)
  backend "gcs" {
    bucket = "strom-data-platform-thanuz-tfstate"
    prefix = "terraform/state"
  }
}