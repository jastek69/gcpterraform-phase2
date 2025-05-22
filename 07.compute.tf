# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

resource "google_compute_instance" "planetrock-prod1" {
  name         = "planetrock-prod1"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-prod-main-us.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("startup.sh")
}
