resource "azurerm_firewall_application_rule_collection" "tags_rule" {
  name                = "Authorize_fqdntags"
  azure_firewall_name = module.firewall_test.name
  resource_group_name = azurerm_resource_group.rg_test.name
  priority            = 101
  action              = "Allow"

  rule {
    name = "Azure_Services"

    source_addresses = [
      "10.0.0.0/16",
    ]

    fqdn_tags = [
      "AzureBackup", "MicrosoftActiveProtectionService", "WindowsUpdate",
    ]
  }
}