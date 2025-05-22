# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

# Iowa - US - us-central1
resource "google_compute_subnetwork" "planetrock-prod-main-us" {
  name                     = "planetrock-prod-main-us"
  ip_cidr_range            = "10.35.20.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.planetrock.id
  private_ip_google_access = true
}


resource "google_compute_subnetwork" "planetrock-app-main-us" {
  name                     = "planetrock-app-main-us"
  ip_cidr_range            = "10.35.40.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.planetrock.id
  private_ip_google_access = true
}
