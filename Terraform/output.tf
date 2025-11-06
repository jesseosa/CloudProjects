output "resource_group_name" {
  description = "The name of the Azure Resource Group created"
  value       = module.rg.name
}

output "acr_name" {
  description = "The name of the Azure Container Registry"
  value       = module.acr.name
}

output "acr_login_server" {
  description = "The login server (URL) of the Azure Container Registry"
  value       = module.acr.login_server
}

output "acr_id" {
  description = "The Azure resource ID of the Container Registry"
  value       = module.acr.id
}
