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

This module provides the following output:

```hcl
output "policy_id" {
  value = azurerm_policy_definition.tag_policy.id
}
```


