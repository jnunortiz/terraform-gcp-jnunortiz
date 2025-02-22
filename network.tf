# Resource: VPC
resource "google_compute_network" "my_vpc" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

# Resource: Subnet
resource "google_compute_subnetwork" "my_subnet" {
  name          = "my-subnet"
  ip_cidr_range = "10.128.0.0/20"
  region        = var.region
  network       = google_compute_network.my_vpc.id
}

# Resource: Firewall Rule SSH
resource "google_compute_firewall" "fw_ssh" {
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