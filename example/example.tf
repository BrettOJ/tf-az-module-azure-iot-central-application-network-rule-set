locals {
  naming_convention_info = {
    name = "001"
    site = "dev"
    env  = "boj"
    app  = "web"
  }
  tags = {
    "Environment" = "Dev"
  }
}


module "resource_groups" {
  source = "git::https://github.com/BrettOJ/tf-az-module-resource-group?ref=main"
  resource_groups = {
    rg = {
      name                   = var.resource_group_name
      location               = var.location
      naming_convention_info = local.naming_convention_info
      tags                   = local.tags
    }
  }
}
module "azurerm_iotcentral_application" {
  source                        = "git::https://github.com/BrettOJ/tf-az-module-azure-iot-central-application?ref=main"
  resource_group_name           = module.resource_groups.rg_output[1].namee
  location                      = var.location
  sub_domain                    = var.sub_domain
  display_name                  = var.display_name
  public_network_access_enabled = var.public_network_access_enabled
  sku                           = var.sku
  template                      = var.template
  naming_convention_info        = local.naming_convention_info
  tags                          = local.tags
}

module "azurerm_iotcentral_application_network_rule_set" {
    source = "git::https://github.com/BrettOJ/tf-az-module-azure-iot-central-application-network-rule-set?ref=main"
  iotcentral_application_id = module.azurerm_iotcentral_application.iotc_app_output.id

  ip_rules = [
    {
      name    = "rule1"
      ip_mask = "10.0.0.0/24"
    },
    {
      name    = "rule2"
      ip_mask = "10.2..0.0/24"
    }
]
}