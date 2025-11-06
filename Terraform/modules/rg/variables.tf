variable "name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where the Resource Group will be created"
  type        = string
}

variable "tags" {
  description = "Optional tags to apply to the Resource Group"
  type        = map(string)
  default     = {}
}
