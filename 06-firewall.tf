# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall

#Planetrock VPC Firewalls
resource "google_compute_firewall" "allow-kiya-ssh" {
  name    = "allow-kiya-ssh"
  network = google_compute_network.planetrock.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]

  }
  source_ranges = ["0.0.0.0/0"]
}


resource "google_compute_firewall" "allow-web" {
  name    = "allow-web"
  network = google_compute_network.planetrock.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = ["0.0.0.0/0"]
}
