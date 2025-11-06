resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location

  # optional tags (useful for cost mgmt)
  tags = merge(
    {
      "Owner"       = "Qashqade Assessment"
      "Environment" = "demo"
    },
    var.tags
  )
}