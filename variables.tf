variable "policy_name" {
  type = string
}
variable "policy_display_name" {
  type = string
}

variable "policy_description" {
  type = string  
}

variable "management_group_id" {
  type = string
  default = ""
}

variable "required_tags" {
  type    = list(string)
}

variable "policy_effect" {
  type = string
  validation {
    condition = contains(["deny","audit"],var.policy_effect)
    error_message = "The policy_effect must be either deny or audit."
  }
}

variable "subscription_id" {
  type = string
}

variable "enforce_policy" {
  type = bool
  default = true
}

variable "location" {
  description = "The Azure Region where the Policy Assignment should exist. Changing this forces a new Policy Assignment to be created."
  type        = string
  default     = "" # Optional, empty string means no specific location is set
}

variable "non_compliance_message" {
  description = "Non-complaince message"
  type        = string
  default = ""
}




