provider "google" {
  project = var.project_id
  region  = var.europe_west1
  zone = var.europe_west1_b
  billing_project = "terraform-gcp-jnunortiz"
  alias = "europe_west1"
}

provider "google" {
  project = var.project_id
  region  = var.europe_west3
  zone = var.europe_west3_a
  billing_project = "terraform-gcp-jnunortiz"
  alias = "europe_west3"
}