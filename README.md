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
  - **Validation**: Each object in the list must include a `subscription_id`, `non_compliance_message` and `enforce_policy`. The `location`  field is optional.If undeclared, no assignments are made.
 
  - ### Example Use

Below is an example configuration showing how to use the module:

```hcl
# Define the module source
module "resource_group_tag_policy" {
  source  = "github.com/LirookIAC/terraform-azure-resourceGroup-tag-policy"
  policy_display_name = "Enforce governance tags on resource groups"
  policy_name = "Tag-policy-RG"
  policy_description = "test"
  required_tags = ["Owner", "Environment"]
  policy_effect = "deny"
  policy_assignments = [
    {
      subscription_id = "/subscriptions/abcd9c8b2-bb60-492d-92a9-d1641fb7adf8"
      enforce_policy = true
      non_compliance_message = "Non compliant"
    }
  ]
}
```
### Explanation

- **`source`**: Specifies the location from where the module is retrieved. In this example, it points to a GitHub repository. Adjust this to match the actual source of your module.

- **`policy_display_name`**: Sets a user-friendly name for the policy as it will appear in the Azure portal. This should be descriptive of what the policy enforces.

- **`policy_name`**: The internal name for the policy definition, which must be unique within the scope of the policy. This name is used for identification in Azure.

- **`policy_description`**: A textual description of what the policy does. This helps users understand the policy's purpose and scope.

- **`required_tags`**: A list of tags that the policy enforces on resource groups. These tags are mandatory for compliance.

- **`policy_effect`**: Defines the impact of the policy. Use `deny` to prevent non-compliant actions or `audit` to log non-compliance without blocking actions.

- **`policy_assignments`**: An array defining where and how the policy is applied:
  - **`subscription_id`**: The ID of the Azure subscription where the policy will be enforced.
  - **`enforce_policy`**: A boolean indicating whether the policy should be actively enforced or just audited.
  - **`non_compliance_message`**: A message that will be shown if a resource fails to comply with the policy.

This configuration ensures that the policy is correctly set up to enforce governance tags on resource groups and assigns it to specified Azure subscriptions. Adjust the values according to your organizational needs and Azure environment.



