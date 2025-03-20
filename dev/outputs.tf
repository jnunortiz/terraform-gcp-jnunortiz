output "vm_instance_id" {
  description = "The ID of the Compute Engine instance."
  value       = google_compute_instance.vm_1.id
}

output "vm_external_ip" {
  description = "The external IP address of the Compute Engine instance."
  value       = google_compute_instance.vm_1.network_interface[0].access_config[0].nat_ip
}

output "vm_self_link" {
  description = "The self link of the Compute Engine instance."
  value       = google_compute_instance.vm_1.self_link
}

output "vm_machine_type" {
  description = "The machine type of the Compute Engine instance."
  value       = google_compute_instance.vm_1.machine_type
}

output "vm_machine_name" {
  description = "The name of the Compute Engine instance."
  value       = google_compute_instance.vm_1.name
}