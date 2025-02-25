variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
}

variable "europe_west1" {
  description = "The region in which to provision resources."
  type        = string
}

variable "europe_west1_a" {
  description = "The zone in which to provision resources."
  type        = string
}

variable "europe_west3" {
  description = "The region in which to provision resources."
  type        = string
}

variable "europe_west3_a" {
  description = "The zone in which to provision resources."
  type        = string
}

variable "machine_type" {
  description = "The machine type to use for the compute instance."
  type        = string
}