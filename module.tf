
resource "azurerm_iotcentral_application_network_rule_set" "iotc_app_network_rule_set" {
  iotcentral_application_id = var.iotcentral_application_id

  dynamic ip_rules {
    for_each = var.ip_rules != null ? var.ip_rules : {}
    content {
      name    = ip_rules.value.name
      ip_mask = ip_rules.value.ip_mask
    }
  }
}