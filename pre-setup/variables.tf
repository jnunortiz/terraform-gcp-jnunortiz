variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "github_repo" {
  description = "The GitHub repository in the format 'owner/repo'"
  type        = string
}

variable "github_org" {
  description = "The GitHub organization in the format 'owner/'"
  type        = string
}