# Terraform Settings Block  
terraform {
  required_version = ">= 1.10.05"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.21.0"
    }
  }
}

# Provider Block
provider "google" {
  project = var.project_id
  region  = var.region
  billing_project = "terraform-gcp-jnunortiz"
}