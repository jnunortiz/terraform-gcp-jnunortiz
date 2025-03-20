# Resource: VPC
resource "google_compute_network" "my_vpc" {
  project = var.project_id
  name                    = "${var.environment}-my-vpc"
  auto_create_subnetworks = false
}

# Subnets: europe-west3
resource "google_compute_subnetwork" "my_subnet" {
  count = 1
  provider = google.europe_west3
  name          = "subnet-${count.index + 1}"
  ip_cidr_range = cidrsubnet("10.128.0.0/16", 4, count.index)
  region        = var.europe_west3
  network       = google_compute_network.my_vpc.id
}

# Resource: Firewall Rule SSH
resource "google_compute_firewall" "fw_ssh" {
  project = var.project_id
  name    = "${var.environment}-fw-ssh22"
  network = google_compute_network.my_vpc.id
  direction = "INGRESS"
  priority = 1000
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-ssh"]
}

# Resource: Firewall Rule HTTP
resource "google_compute_firewall" "fw_http" {
  project = var.project_id
  name    = "${var.environment}-fw-http80"
  network = google_compute_network.my_vpc.id
  direction = "INGRESS"
  priority = 1000
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["allow-http"]
}