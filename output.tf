# https://developer.hashicorp.com/terraform/language/values/outputs

# output "compute_zones" {
#     description = "values of the compute zones"
#     value       = google_compute_zones.available_zones.names
  
# }

/*
output "instance_external_ip" {
  value       = "http://${google_compute_instance.planetrock-prod1.network_interface[0].access_config[0].nat_ip}"
  description = "The external IP address of the GCE instance."
}


output "instance_external_ips" {
  value = {
    vm1 = "http://${google_compute_instance.planetrock-prod1.network_interface[0].access_config[0].nat_ip}"
    vm2 = "http://${google_compute_instance.planetrock-prod2.network_interface[0].access_config[0].nat_ip}"
    vm3 = "http://${google_compute_instance.planetrock-prod3.network_interface[0].access_config[0].nat_ip}"
  }
  description = "External IPs of both VMs"
}
*/

output "instance_external_ips" {
  value = {
    "${google_compute_instance.planetrock-prod1-iowa.name}" = "http://${google_compute_instance.planetrock-prod1-iowa.network_interface[0].access_config[0].nat_ip}"    
    "${google_compute_instance.planetrock-prod2-tokyo.name}" = "http://${google_compute_instance.planetrock-prod2-tokyo.network_interface[0].access_config[0].nat_ip}"    
    "${google_compute_instance.planetrock-prod3-saopaulo.name}"  = "http://${google_compute_instance.planetrock-prod3-saopaulo.network_interface[0].access_config[0].nat_ip}"    
  }
  description = "External IPs of all VMs"
}


output "instance_external_zones" {
    value = {
        "${google_compute_instance.planetrock-prod1-iowa.zone}" = "http://${google_compute_instance.planetrock-prod1-iowa.network_interface[0].access_config[0].nat_ip}"
        "${google_compute_instance.planetrock-prod2-tokyo.zone}" = "http://${google_compute_instance.planetrock-prod2-tokyo.network_interface[0].access_config[0].nat_ip}"
        "${google_compute_instance.planetrock-prod3-saopaulo.zone}" = "http://${google_compute_instance.planetrock-prod3-saopaulo.network_interface[0].access_config[0].nat_ip}"
    }
    description = "External IPs of all VMs with their zones"  
}



# https://developer.hashicorp.com/terraform/language/functions/join
output "compute_zones" {
  description = "Comma-separated compute zones"
  # convert set into string delimited by commas (CSV) before output
  value       = join(", ", data.google_compute_zones.available.names)
}

output "compute_zones_list" {
  description = "List of compute zones"
  value       = data.google_compute_zones.available.names
}


# ALB Frontend Static IP
output "lb_static_ip_address" {
  description = "The static IP address of the load balancer."
  value       = "http://${google_compute_address.lb.address}"
}
