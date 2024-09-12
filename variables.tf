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

variable "policy_assignments" {
  description = "A list of policy configurations including subscription_id, enforce_policy, location, and non_compliance_message."
  type = list(object({
    subscription_id        = string
    enforce_policy         = bool
    location               = optional(string,"")
    non_compliance_message = string
  }))
  default = []
}





