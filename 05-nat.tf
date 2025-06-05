# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat

# Router Iowa
resource "google_compute_router_nat" "iowanat" {
  name   = "iowanat"
  router = google_compute_router.iowarouter.name
  region = "us-central1"

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  nat_ip_allocate_option             = "MANUAL_ONLY"

  subnetwork {
    name                    = google_compute_subnetwork.planetrock-prod-main-iowa.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.iowanat.self_link]
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address
# Static IP address in order to make Private
resource "google_compute_address" "iowanat" {
  name         = "iowanat"
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  region       = "us-central1"
  /* depends_on = [google_project_service.compute] */
}
