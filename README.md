[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/azure_firewall)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=11)
# Deploys Azure Firewall
Creates an Azure Firewall in a given region


Reference the module to a specific version (recommended):
```hcl
module "az_firewall" {
    source                  = "git://github.com/aztfmod/az_firewall.git?ref=v0.1"
  
    az_fw_name                        = var.az_fw_name
    az_fw_rg                          = var.virtual_network_rg
    subnet_id                         = var.subnetid
    public_ip_id                      = var.pip.id
    location                          = var.location["region1"]
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    log_analytics_workspace           = var.log_analytics_workspace
}
```

Or get the latest version
```hcl
module "az_firewall" {
    source                  = "git://github.com/aztfmod/az_firewall.git?ref=latest"
  
    az_fw_name                        = var.az_fw_name
    az_fw_rg                          = var.virtual_network_rg
    subnet_id                         = var.subnetid
    public_ip_id                      = var.pip.id
    location                          = var.location["region1"]
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    log_analytics_workspace           = var.log_analytics_workspace
}
```

# Parameters
## az_fw_name
(Required) Name of the Azure Firewall to be created
```hcl
variable "az_fw_name" {
  description = "(Required) Name of the Azure Firewall to be created"  
}

```
Example
```hcl
az_fw_name = "arnaud-firewall"
```

## az_fw_rg
(Required) Resource Group of the Azure Firewall to be created.
```hcl
variable "az_fw_rg" {
  description = "(Required) Resource Group of the Azure Firewall to be created"  
}

```
Example
```hcl
resource_group_name = "operations-rg"
```

## subnet_id
(Required) ID for the subnet where to deploy the Azure Firewall
```hcl
variable "subnet_id" {
  description = "(Required) ID for the subnet where to deploy the Azure Firewall " 
}

```
Example
```hcl
subnet_id = "/subscriptions/00000000-0000-0000-aa36-000000000000/resourceGroups/ftau-HUB-CORE-NET/providers/Microsoft.Network/virtualNetworks/ftau-Shared-Services/subnets/AzureFirewallSubnet"
```


## public_ip_id
(Required) ID for the subnet where to deploy the Azure Firewall
```hcl
variable "public_ip_id" {
  description = "(Required) Public IP address identifier. IP address must be of type static and standard."
}
```
Example
```hcl
public_ip_id = "/subscriptions/00000000-0000-0000-aa36-000000000000/resourceGroups/ftau-HUB-EDGE-NETS/providers/Microsoft.Network/publicIPAddresses/az_fw_pip"
```

## location
(Required) Define the region where the Azure Firewall will be created.
```hcl

variable "location" {
  description = "(Required) Define the region where the Azure Firewall vault will be created"
  type        = string
}
```
Example
```hcl
    location    = "southeastasia"
```

## tags
(Required) Map of tags for the deployment
```hcl
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```hcl
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

## diagnostics_map
(Required) Map with the diagnostics repository information"
```hcl
variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example
```hcl
  diagnostics_map = {
      diags_sa      = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.Storage/storageAccounts/opslogskumowxv"
      eh_id         = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/arnaud-hub-operations/providers/Microsoft.EventHub/namespaces/opslogskumowxv"
      eh_name       = "opslogskumowxv"
  }
```
## log_analytics_workspace
(Required) Log Analytics Workspace details
```hcl
variable "log_analytics_workspace" {
  description = "(Required) Log Analytics data for the AzFW diagnostics"
}
```
Example
```hcl
  log_analytics_workspace = {
        id = "/subscriptions/783438ca-d497-4350-aa36-dc55fb0983ab/resourcegroups/ftau-hub-operations/providers/microsoft.operationalinsights/workspaces/ftaulevel1"
        name = "ftaulevel1"
  }
```

## diagnostics_settings
(Required) Map with the settings for diagnostics of Azure Firewall
```hcl
variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example


diagnostics_settings = {
    log = [
                #["Category name",  "Diagnostics Enabled(true/false)", "Retention Enabled(true/false)", Retention_period] 
                ["AzureFirewallApplicationRule", true, true, 30],
                ["AzureFirewallNetworkRule", true, true, 30],
        ]
    metric = [
               ["AllMetrics", true, true, 30],
    ]
}


# Output
## az_firewall_config
Returns the Azure Firewall object with following attributes:
This is an old output kept for compatibility reason with v0.1
which might nolonger be supported in future versions.

```hcl
output "az_firewall_config" {
  value = {
      az_fw_name        = azurerm_firewall.az_firewall.name
      az_fw_id          = azurerm_firewall.az_firewall.id
      az_ipconfig       = azurerm_firewall.az_firewall.ip_configuration
      az_object         = azurerm_firewall.az_firewall
  }
}
```

## object
Returns the Azure Firewall object with following attributes:

```hcl
output "object" {
  value                 = azurerm_firewall.az_firewall
}
```

## name
Returns the Azure Firewall name:

```hcl
output "name" {
  value                 = azurerm_firewall.az_firewall.name
}
```

## id
Returns the Azure Firewall ID

```hcl
output "id" {
  value                 = azurerm_firewall.az_firewall.id
}
```