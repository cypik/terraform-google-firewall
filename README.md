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

This Terraform configuration sets up GCP infrastructure, including a Virtual Private Cloud (VPC) and firewall rules with specified configurations.

## Usage

To get started, make sure you have configured your GCP provider. You can use the following code as a starting point:
## Example: firewall
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
- name (string): The name of the infrastructure components.
- environment (string): The environment in which the infrastructure is being created.
- project_id (string): The GCP project ID.
- routing_mode (string): The routing mode for the VPC (e.g., "REGIONAL").
- network_firewall_policy_enforcement_order (string): The enforcement order for network firewall policies.
- priority (number): The priority of the firewall rule.
- source_ranges (list of strings): The source IP ranges for the firewall rule.
- allow (list of objects): The rules defining the allowed protocols and ports.

## Examples
For detailed examples on how to use these modules, please refer to the '[examples](https://github.com/cypik/terraform-gcp-firewall/blob/master/example)' directory within this repository.
## Author
Your Name Replace '[License Name]' and '[Your Name]' with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/cypik/terraform-gcp-firewall/blob/master/LICENCE) file for details.
