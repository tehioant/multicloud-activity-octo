terraform {
  required_version = "1.5.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.77.0"
    }
  }
}

provider "google" {
  project     = "alltribes"
  region      = "europe-west9-a"
}