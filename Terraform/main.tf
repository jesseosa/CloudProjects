module "rg" {
  source   = "./modules/resource_group"
  name     = "${var.project}-rg"
  location = var.location
}

module "acr" {
  source              = "./modules/acr"
  name_prefix         = var.project
  resource_group_name = module.rg.name
  location            = module.rg.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
}