data "template_file" "policy" {
  template = file("policy.json.tpl")
  vars = {
    tag_checks = jsonencode(local.tag_checks)
    effect = var.policy_effect
  }
}


resource "azurerm_policy_definition" "tag_policy" {
  name         = var.policy_name
  policy_type  = "Custom"
  mode         = "All"
  display_name = var.policy_display_name
  description  = var.policy_description
  management_group_id = var.management_group_id == "" ? null : var.management_group_id

  # Policy Rule to check if all required tags from the array are present
  policy_rule = data.template_file.policy.rendered
}

data "azurerm_subscription" "subscription" {
  id = var.subscription_id
}

resource "azurerm_subscription_policy_assignment" "example" {
  name                 = "${azurerm_policy_definition.tag_policy.name}_${data.azurerm_subscription.subscription.display_name}"
  policy_definition_id = azurerm_policy_definition.tag_policy.id
  subscription_id      = data.azurerm_subscription.subscription.id
  enforce = var.enforce_policy
  dynamic "non_compliance_message" {
    for_each = var.non_compliance_message == "" ? []: [1]
    content {
      content = non_compliance_message.value
    }
  }
  location = var.location == "" ? null : var.location 

}