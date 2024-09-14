# Azure Policy Definition and Assignment Module

## Overview
This module creates an Azure Policy Definition and assigns it to specified subscriptions. It uses a template file to define the policy rule and supports dynamic policy assignment based on provided parameters.

## Version Constraints

To ensure compatibility with this module, the following version constraints apply:

```hcl
terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.112.0, < 4.0.0"
    }
  }
}
```
- Terraform: Tested with version 1.7.5  
- AzureRM Provider: Tested with version 3.116.0

## Outputs

This module does not currently provide outputs.

## Variables

The following variables are used in this module:

- `policy_name` (string): The name of the policy definition.
- `policy_display_name` (string): The display name for the policy.
- `policy_description` (string): A description of the policy.
- `management_group_id` (string): Optional ID of the management group for the policy.
- `policy_effect` (string): The effect of the policy (e.g., `deny`, `audit`).
- `policy_assignments` (list): List of policy assignments, each containing:
  - `subscription_id` (string): The ID of the subscription to assign the policy to.
  - `enforce_policy` (bool): Whether the policy should be enforced.
  - `non_compliance_message` (string): Optional message for non-compliance.
  - `location` (string): Optional location for the policy assignment.

---

Feel free to customize or extend the documentation based on your specific needs!

