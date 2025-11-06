output "id" {
  description = "The Azure Resource ID of the Container Registry"
  value       = azurerm_container_registry.this.id
}

output "name" {
  description = "The name of the Container Registry"
  value       = azurerm_container_registry.this.name
}

output "login_server" {
  description = "The login server URL (e.g. qashqadedemoacr.azurecr.io)"
  value       = azurerm_container_registry.this.login_server
}

output "admin_username" {
  description = "Admin username for the ACR (only if admin_enabled = true)"
  value       = azurerm_container_registry.this.admin_username
  sensitive   = true
}

output "admin_password" {
  description = "Admin password for the ACR (only if admin_enabled = true)"
  value       = azurerm_container_registry.this.admin_password
  sensitive   = true
}
