terraform {
  required_version = ">= 1.10.05"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.21.0"
    }
  }
}