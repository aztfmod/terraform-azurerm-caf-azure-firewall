[![VScodespaces](https://img.shields.io/endpoint?url=https%3A%2F%2Faka.ms%2Fvso-badge)](https://online.visualstudio.com/environments/new?name=terraform-azurerm-caf-azure-firewall&repo=terraform-azurerm-caf-azure-firewall)
[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Deploys Azure Firewall
Creates an Azure Firewall in a given region


Reference the module to a specific version (recommended):
```hcl
module "az_firewall" {
  source  = "aztfmod/caf-azure-firewall/azurerm"
  version = "0.x.y"

  convention                  = local.convention
  name                        = local.az_fw_config.name
  resource_group_name         = azurerm_resource_group.rg_test.name
  location                    = local.location 
  tags                        = local.tags
  la_workspace_id             = module.la_test.id
  diagnostics_map             = module.diags_test.diagnostics_map
  diagnostics_settings        = local.az_fw_config.diagnostics

  subnet_id                   = lookup(module.vnet_test.vnet_subnets, "AzureFirewallSubnet", null)
  public_ip_id                = module.public_ip_test.id
}
```

<!--- BEGIN_TF_DOCS --->
<!--- END_TF_DOCS --->