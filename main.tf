module "labels" {
  source = "git::git@github.com:opz0/terraform-gcp-labels.git?ref=master"

  name        = var.name
  environment = var.environment
  label_order = var.label_order
  managedby   = var.managedby
  repository  = var.repository
}

#####==============================================================================
##### Each network has its own firewall controlling access to and from the instances.
#####==============================================================================

resource "google_compute_firewall" "default" {
  count     = var.enabled && var.firewall_enabled ? 1 : 0
  name      = format("%s-firewall", module.labels.id)
  network   = var.network
  direction = var.direction
  disabled  = var.disabled
  priority  = var.priority

  dynamic "allow" {
    for_each = var.allow

    content {
      protocol = allow.value.protocol
      ports    = allow.value.ports
    }
  }

  dynamic "deny" {
    for_each = var.deny
    content {
      protocol = deny.value.protocol
      ports    = deny.value.ports
    }
  }

  source_ranges = var.source_ranges
}