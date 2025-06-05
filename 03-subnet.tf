# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork

# Iowa - US - us-central1
resource "google_compute_subnetwork" "planetrock-prod-main-iowa" {
  name                     = "planetrock-prod-main-iowa"
  ip_cidr_range            = "10.35.20.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.planetrock.id
  private_ip_google_access = true
}


resource "google_compute_subnetwork" "planetrock-app-main-tokyo" {
  name                     = "planetrock-app-main-tokyo"
  ip_cidr_range            = "10.35.40.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.planetrock.id
  private_ip_google_access = true
}


resource "google_compute_subnetwork" "planetrock-prod-saopaulo" {
  name                     = "planetrock-prod-saopaulo"
  ip_cidr_range            = "10.35.80.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.planetrock.id
  private_ip_google_access = true
}


# Regional Proxy Only Subnet for LB
# Required for Regional Application Load Balancer for traffic offloading
resource "google_compute_subnetwork" "regional_proxy_subnet" {
  name          = "regional-proxy-subnet"
  region        = "us-central1"
  ip_cidr_range = "198.168.255.0/24" # Example CIDR, adjust as needed - use non-common range for security and ease troubleshooting
  # This purpose reserves this subnet for regional Envoy-based load balancers
  purpose       = "REGIONAL_MANAGED_PROXY"
  network       = google_compute_network.planetrock.id
  role          = "ACTIVE"
}
