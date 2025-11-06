variable "project" {
  description = "Base name for all Azure resources (e.g., qashqade-demo)"
  type        = string
  default     = "qashqade-demo"
}

variable "location" {
  description = "Azure region to deploy resources into"
  type        = string
  default     = "eastus"
}

variable "acr_sku" {
  description = "ACR SKU: Basic | Standard | Premium"
  type        = string
  default     = "Basic"
}

variable "acr_admin_enabled" {
  description = "Enable admin user for ACR (handy for demos)"
  type        = bool
  default     = true
}