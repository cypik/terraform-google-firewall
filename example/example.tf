provider "google" {
  project = "opz0-397319"
  region  = "asia-northeast1"
  zone    = "asia-northeast1-a"
}

#####==============================================================================
##### vpc module call.
#####==============================================================================
module "vpc" {
  source                                    = "git::https://github.com/opz0/terraform-gcp-vpc.git?ref=v1.0.0"
  name                                      = "app"
  environment                               = "test"
  routing_mode                              = "REGIONAL"
  network_firewall_policy_enforcement_order = "AFTER_CLASSIC_FIREWALL"
}

#####==============================================================================
##### Firewall module call.
#####==============================================================================
module "firewall" {
  source        = "./../."
  name          = "app"
  environment   = "test"
  network       = module.vpc.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  allow = [
    { protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}