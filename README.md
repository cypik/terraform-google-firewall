# terraform-gcp-firewall
# GCP Infrastructure Terraform Configuration

## Table of Contents

- [Introduction](#introduction)
- [Usage](#usage)
- [Module Inputs](#module-inputs)
- [Examples](#examples)
- [Author](#author)
- [License](#license)

## Introduction

This project deploys a Google Cloud infrastructure using Terraform to create **FIREWALL** .

## Usage

To get started, make sure you have configured your GCP provider. You can use the following code as a starting point:
## Example: _firewall_
```hcl

module "firewall" {
  source        = "git::https://github.com/cypik/terraform-gcp-firewall.git?ref=v1.0.0"
  name          = "app"
  environment   = "test"
  network       = module.vpc.vpc_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]

  allow = [
    {
      protocol = "tcp"
      ports    = ["22", "80"]
    }
  ]
}
```
Make sure to configure the provider block with your GCP credentials or use other authentication methods. Adjust the variables according to your requirements.

## Module Inputs
- `name` : The name of the infrastructure components.
- `environment` : The environment in which the infrastructure is being created.
- `project_id` : The GCP project ID.
- `routing_mode` : The routing mode for the VPC (e.g., "REGIONAL").
- `network_firewall_policy_enforcement_order` : The enforcement order for network firewall policies.
- `priority` : The priority of the firewall rule.
- `source_ranges` : The source IP ranges for the firewall rule.
- `allow` : The rules defining the allowed protocols and ports.

## Examples
For detailed examples on how to use these modules, please refer to the [EXAMPLE](https://github.com/cypik/terraform-gcp-firewall/tree/master/example) directory within this repository.
## Author
Your Name Replace **'[License Name]'** and **'[Your Name]'** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/cypik/terraform-gcp-firewall/blob/master/LICENCE) file for details.
