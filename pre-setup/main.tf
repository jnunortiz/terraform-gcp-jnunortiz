provider "google" {
  project = var.project_id
  region  = var.region
}

# Create the service account
resource "google_service_account" "terraform_service_account" {
  account_id   = "terraform-github-account"
  display_name = "Terraform Github Account"
}

# Assign IAM roles to the service account
resource "google_project_iam_member" "service_account_roles" {
  for_each = toset([
    "roles/storage.admin",
    "roles/iam.serviceAccountTokenCreator",
    "roles/iam.serviceAccountUser",
    "roles/resourcemanager.projectIamAdmin",
    "roles/compute.networkViewer"
  ])
  project = var.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.terraform_service_account.email}"
}

# Configure workload identity federation
resource "google_iam_workload_identity_pool" "github_actions_pool" {
  workload_identity_pool_id = "github-actions-pool"
  display_name              = "GitHub Actions WIP"
  description               = "Workload Identity Pool for GitHub Actions"
}

resource "google_iam_workload_identity_pool_provider" "github_provider" {
  workload_identity_pool_id = google_iam_workload_identity_pool.github_actions_pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github"
  display_name              = "GitHub Actions Provider"
  attribute_condition = "attribute.repository.startsWith('${var.github_org}')"
  attribute_mapping = {
    "google.subject"       = "assertion.sub"
    "attribute.actor"      = "assertion.actor"
    "attribute.aud"        = "assertion.aud"
    "attribute.repository" = "assertion.repository"
  }
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

# Allow the service account to impersonate via workload identity federation
resource "google_service_account_iam_member" "workload_identity_binding" {
  service_account_id = google_service_account.terraform_service_account.name
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.github_actions_pool.name}/attribute.repository/${var.github_repo}"
}