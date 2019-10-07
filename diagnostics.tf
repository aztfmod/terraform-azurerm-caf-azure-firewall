module "diagnostics_az_fw" {
  source = "git://github.com/aztfmod/diagnostics.git?ref=v0.1.1"
  
    name                            = azurerm_firewall.az_firewall.name
    resource_id                     = azurerm_firewall.az_firewall.id
    log_analytics_workspace_id      = var.log_analytics_workspace_id
    diagnostics_map                 = var.diagnostics_map
    diag_object                     = var.diagnostics_settings
}