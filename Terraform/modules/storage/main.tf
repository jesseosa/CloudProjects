# resource "azurerm_storage_account" "this" {
#   name                     = lower(replace("${var.name_prefix}tfstate", "-", ""))
#   resource_group_name      = var.resource_group_name
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   kind                     = "StorageV2"
#   enable_https_traffic_only = true
# }

# resource "azurerm_storage_container" "this" {
#   name                  = var.container_name
#   storage_account_name  = azurerm_storage_account.this.name
#   container_access_type = "private"
# }
