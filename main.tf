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