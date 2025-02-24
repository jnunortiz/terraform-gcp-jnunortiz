# Resource: Compute Instance
resource "google_compute_instance" "vm_1" {
  project = var.project_id
  name         = "vm-1"
  machine_type = var.machine_type
  zone = var.europe_west3_a
  tags = [
    tolist(google_compute_firewall.fw_ssh.target_tags)[0], 
    tolist(google_compute_firewall.fw_http.target_tags)[0]
  ]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Install Web Server
  metadata_startup_script = file("${path.module}/webserver_install.sh")

  network_interface {
    network    = google_compute_network.my_vpc.id
    subnetwork = google_compute_subnetwork.my_subnet_2.id
    access_config {
    }
  }
}