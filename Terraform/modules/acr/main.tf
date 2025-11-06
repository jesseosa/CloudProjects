resource "azurerm_container_registry" "this" {
  name                = "${lower(replace(var.name_prefix, "-", ""))}acr"
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = var.sku
  admin_enabled = var.admin_enabled

  tags = merge(
    {
      "Owner"       = "Qashqade Assessment"
      "Environment" = "demo"
    },
    var.tags
  )
}