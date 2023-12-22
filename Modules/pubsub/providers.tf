terraform {
  required_version = ">= 0.13"
  required_providers {

    google = {
      source  = "hashicorp/google"
      version = ">= 4.78, < 6"
    }
  }

  provider_meta "google" {
    module_name = "blueprints/terraform/terraform-google-pubsub/v6.0.0"
  }

}