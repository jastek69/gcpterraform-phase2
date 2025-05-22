# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket      = "taaopsfirstterraformbucket"
    prefix      = "terraform/state"
    credentials = "taaops-e9943412868a.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
