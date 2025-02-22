# Resource: Compute Instance
resource "google_compute_instance" "vm_1" {
  name         = "vm-1"
  machine_type = "e2-micro"
  zone         = var.zone
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
    subnetwork = google_compute_subnetwork.my_subnet.id
    access_config {
    }
  }
}