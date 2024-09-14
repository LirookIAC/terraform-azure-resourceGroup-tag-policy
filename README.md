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
## Usage

To use this module, follow these steps:

1. **Define Module Source**

   Specify the source path or URL of the module in your Terraform configuration. This could be a local path or a remote repository.

   ```hcl
   module "policy" {
     source = "path_to_module_or_repository"
   }
   ```
2. **Set Required Variables**

   Configure the following variables to tailor the policy to your needs:

- **`policy_name`**
  - **Description**: The name of the policy definition.
  - **Type**: `string`
  - **Validation**: Must not be empty.

- **`policy_display_name`**
  - **Description**: The display name for the policy.
  - **Type**: `string`
  - **Validation**: Must not be empty.

- **`policy_description`**
  - **Description**: A description of the policy.
  - **Type**: `string`
  - **Validation**: Must not be empty.

- **`management_group_id`**
  - **Description**: Optional ID of the management group for the policy. Leave undeclared if not used.
  - **Type**: `string`

- **`policy_effect`**
  - **Description**: The effect of the policy. Must be either `deny` or `audit`.
  - **Type**: `string`
  - **Validation**: Must be one of `deny` or `audit`.

- **`policy_assignments`**
  - **Description**: A list of policy configurations, including subscription ID, enforce policy, location, and non-compliance message.
  - **Type**: `list(object({`
    - `subscription_id        = string`
    - `enforce_policy         = bool`
    - `location               = optional(string, "")`
    - `non_compliance_message = string`
  - **Default**: `[]`
  - **Validation**: Each object in the list must include a `subscription_id`, `non_compliance_message` and `enforce_policy`. The `location`  field is optional.


