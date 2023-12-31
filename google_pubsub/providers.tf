terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.40.0" # tftest
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.40.0" # tftest
    }
  }
}