locals {
  tag_checks = [
    for tag in var.required_tags : {
      field   = "tags[${tag}]",
      exists  = true
    }
  ]
}