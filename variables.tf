variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "terraform-gcp-jnunortiz"
}

variable "region" {
  description = "The region in which to provision resources."
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "The zone in which to provision resources."
  type        = string
  default     = "europe-west3-a"
}