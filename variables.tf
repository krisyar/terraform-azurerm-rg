variable "override_rg_name" {
  description = ""
  default     = null
}

variable "project_name" {
  validation {
    condition = (
      length(var.project_name) <= 10
    )
    error_message = "Project Name should be less than 10 Characters."
  }
  default = ""
}

variable "environment" {
  description = ""
  default     = null
}

variable "locations" {
  description = ""
  type        = list(string)
  default     = ["Central US"]
}

variable "projectcode" {
  description = ""
  validation {
    condition = (
      length(var.projectcode) == 5
    )
    error_message = "Project code should be 5 chars"
  }
  default = "00012"

}

variable "costcenter" {
  description = ""
  type        = string
  validation {
    condition = (
      length(var.costcenter) == 7 || var.costcenter == ""
    )
    error_message = "Cost Center must be 7 digits long."
  }
  default = "00001"

}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}
