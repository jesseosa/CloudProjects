variable "name_prefix" {
  description = "Base prefix used to construct the ACR name (hyphens removed automatically)"
  type        = string
  default     = "qashqade-demo"
}

variable "resource_group_name" {
  description = "Name of the Resource Group to deploy the ACR into"
  type        = string
}

variable "location" {
  description = "Azure region for the ACR"
  type        = string
}

variable "sku" {
  description = "ACR SKU (Basic | Standard | Premium). Basic is cheapest and fine for demos."
  type        = string
  default     = "Basic"
}

variable "admin_enabled" {
  description = "Whether to enable the admin user for local/dev authentication"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Optional map of tags"
  type        = map(string)
  default     = {}
}
