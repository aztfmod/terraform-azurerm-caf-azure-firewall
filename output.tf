output "az_firewall_config" {
#old output kept for compatibility reason with v0.1
#might nolonger be supported in future versions

  value = {
      az_fw_name        = azurerm_firewall.az_firewall.name
      az_fw_id          = azurerm_firewall.az_firewall.id
      az_ipconfig       = azurerm_firewall.az_firewall.ip_configuration
      az_object         = azurerm_firewall.az_firewall
  }
}

output "id" {
  value                 = azurerm_firewall.az_firewall.id
}

output "name" {
  value                 = azurerm_firewall.az_firewall.name
}

output "object" {
  value                 = azurerm_firewall.az_firewall
}