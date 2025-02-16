provider "google" {
  project = var.project_id
  region  = var.region
  billing_project = "terraform-gcp-jnunortiz"
}