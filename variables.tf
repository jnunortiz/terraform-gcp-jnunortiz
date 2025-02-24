variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "terraform-gcp-jnunortiz"
}

variable "europe_west1" {
  description = "The region in which to provision resources."
  type        = string
  default     = "europe-west1"
}

variable "europe_west1_a" {
  description = "The zone in which to provision resources."
  type        = string
  default     = "europe-west1-a"
}

variable "europe_west3" {
  description = "The region in which to provision resources."
  type        = string
  default     = "europe-west3"
}

variable "europe_west3_a" {
  description = "The zone in which to provision resources."
  type        = string
  default     = "europe-west3-a"
}

variable "machine_type" {
  description = "The machine type to use for the compute instance."
  type        = string
  default     = "e2-micro"
}