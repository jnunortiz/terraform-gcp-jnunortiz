# Resource: VPC
resource "google_compute_network" "my_vpc" {
  project = var.project_id
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

# Subnet 1: europe-west1
resource "google_compute_subnetwork" "my_subnet_1" {
  provider = google.europe_west1
  name          = "my-subnet"
  ip_cidr_range = "10.128.0.0/20"
  network       = google_compute_network.my_vpc.id
}

# Subnet 2: europe-west3
resource "google_compute_subnetwork" "my_subnet_2" {
  provider = google.europe_west3
  name          = "my-subnet"
  ip_cidr_range = "10.132.0.0/20"
  network       = google_compute_network.my_vpc.id
}

# Resource: Firewall Rule SSH
resource "google_compute_firewall" "fw_ssh" {
  project = var.project_id
  name    = "fw-ssh22"
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
  name    = "fw-http80"
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