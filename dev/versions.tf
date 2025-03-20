terraform {
  required_version = ">= 1.10.05"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.21.0"
    }
  }

  backend "gcs" {
    bucket = "gcp-jnunortiz-terraform-state"
    prefix = "env/dev"
  }
}