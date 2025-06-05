# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template
# https://developer.hashicorp.com/terraform/language/functions/file
# Google Compute Engine: Regional Instance Template

# This is for Iowa - US - us-central1
resource "google_compute_region_instance_template" "app01" {
  name         = "app01-template-terraform"
  region       = "us-central1"
  description  = "This template is used to create app instances in the region by cloning our VM."
  machine_type = "e2-medium"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-prod-main-iowa.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}


# This is for Japan - Tokyo - asia-northeast1
resource "google_compute_region_instance_template" "tokyo-app01" {
  name         = "tokyo-app01-template-terraform"
  region       = "asia-northeast1"
  description  = "This template is used to create app instances in the region by cloning our VM."
  machine_type = "e2-medium"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-app-main-tokyo.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}


# This is for Sao Paulo - Brazil - southamerica-east1
resource "google_compute_region_instance_template" "saopaulo-app01" {
  name         = "saopaulo-app01-template-terraform"
  region       = "southamerica-east1"
  description  = "This template is used to create app instances in the region by cloning our VM."
  machine_type = "e2-medium"

  # Create a new disk from an image and set as boot disk
  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  # Network Configurations 
  network_interface {
    subnetwork = google_compute_subnetwork.planetrock-prod-saopaulo.id
    /*access_config {
      # Include this section to give the VM an external IP address
    } */
  }

  # Install Webserver using file() function
  metadata_startup_script = file("./startup.sh")
}
