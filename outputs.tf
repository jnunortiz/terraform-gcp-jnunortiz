output "vm_instance_id" {
  description = "The ID of the Compute Engine instance."
  value       = google_compute_instance.vm_1.id
}

output "vm_external_ip" {
  description = "The external IP address of the Compute Engine instance."
  value       = google_compute_instance.vm_1.network_interface[0].access_config[0].nat_ip
}