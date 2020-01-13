data "azurerm_client_config" "current" {
}

module "rg_test" {
  source  = "aztfmod/caf-resource-group/azurerm"
  version = "0.1.1"
  
    prefix          = local.prefix
    resource_groups = local.resource_groups
    tags            = local.tags
}

module "la_test" {
  source  = "aztfmod/caf-log-analytics/azurerm"
  version = "0.1.0"
  
    # convention          = local.convention
    location            = local.location
    name                = local.name
    solution_plan_map   = local.solution_plan_map 
    prefix              = local.prefix
    resource_group_name = module.rg_test.names.test
    tags                = local.tags
}

module "diags_test" {
  source  = "aztfmod/caf-diagnostics-logging/azurerm"
  version = "0.1.2"

  resource_group_name   = module.rg_test.names.test
  prefix                = local.prefix
  location              = local.location
  tags                  = local.tags
}

module "vnet_test" {
  source  = "aztfmod/caf-virtual-network/azurerm"
  version = "0.2.0"
    
  virtual_network_rg                = module.rg_test.names.test
  prefix                            = local.prefix
  location                          = local.location
  networking_object                 = local.vnet_config
  tags                              = local.tags
  diagnostics_map                   = module.diags_test.diagnostics_map
  log_analytics_workspace           = module.la_test
  diagnostics_settings              = local.vnet_config.diagnostics
}

module "public_ip_test" {
  source  = "aztfmod/caf-public-ip/azurerm"
  version = "0.1.3"

  name                             = local.ip_addr_config.ip_name
  location                         = local.location
  rg                               = module.rg_test.names.test
  ip_addr                          = local.ip_addr_config
  tags                             = local.tags
  diagnostics_map                  = module.diags_test.diagnostics_map
  log_analytics_workspace_id       = module.la_test.id
  diagnostics_settings             = local.ip_addr_config.diagnostics
}

module "firewall_test" {
  source = "../../"
  
  convention               = local.convention
  name                     = local.az_fw_config.name
  rg                       = module.rg_test.names.test
  location                 = local.location 
  tags                     = local.tags
  log_analytics_workspace_id = module.la_test.id
  diagnostics_map          = module.diags_test.diagnostics_map
  diagnostics_settings     = local.az_fw_config.diagnostics

  subnet_id                = lookup(module.vnet_test.vnet_subnets, "AzureFirewallSubnet", null)
  public_ip_id             = module.public_ip_test.id
}

