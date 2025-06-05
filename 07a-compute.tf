# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance

# Iowa - US - us-central1-a
resource "google_compute_instance" "planetrock-prod1-iowa" {
  name         = "planetrock-prod1-iowa"
  machine_type = "n2-standard-2"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-prod-main-iowa.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("startup.sh")
}

# Tokyo - JAPAN - asia-northeast1-a
resource "google_compute_instance" "planetrock-prod2-tokyo" {
  name         = "planetrock-prod2-tokyo"
  machine_type = "n2-standard-2"
  zone         = "asia-northeast1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-app-main-tokyo.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("startup.sh")
}


# SAO PAULO - BRAZIL - southamerica-east1-a
resource "google_compute_instance" "planetrock-prod3-saopaulo" {
  name         = "planetrock-prod3-saopaulo"
  machine_type = "n2-standard-2"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-prod-saopaulo.name
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("startup.sh")
}
