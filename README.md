[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Deploys Azure Firewall
Creates an Azure Firewall in a given region


Reference the module to a specific version (recommended):
```hcl
module "az_firewall" {
    source  = "aztfmod/caf-azure-firewall/azurerm"
    version = "0.x.y"

    name                              = var.az_fw_name
    resource_group_name               = var.virtual_network_rg
    subnet_id                         = var.subnetid
    public_ip_id                      = var.pip.id
    location                          = var.location["region1"]
    tags                              = var.tags
    diagnostics_map                   = var.diagnostics_map
    la_workspace_id                   = var.log_analytics_workspace
}
```

## Inputs

| Name | Type | Default | Description | 
| -- | -- | -- | -- | 
| name | string | None | Specifies the name of the Container Registry. Changing this forces a new resource to be created. |
| resource_group_name | string | None | The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created. |
| location | string | None | Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.  | 
| tags | map | None | Map of tags for the deployment.  | 
| la_workspace_id | string | None | Log Analytics Repository ID. | 
| diagnostics_map | map | None | Map with the diagnostics repository information.  | 
| diagnostics_settings | object | None | Map with the diagnostics settings for ASR deployment. See the required structure in the following example or in the diagnostics module documentation. | 
| subnet_id | string | None | ID for the subnet where to deploy the Azure Firewall  | 
| public_ip_id | string | None | ID for the public IP to deploy the Azure Firewall | 
| convention | string | None | Naming convention to be used (check at the naming convention module for possible values).  | 
| prefix | string | None | (Optional) Prefix to be used. |
| postfix | string | None | (Optional) Postfix to be used. |
| max_length | string | None | (Optional) maximum length to the name of the resource. |

## Output

| Name | Type | Description | 
| -- | -- | -- | 
| object | object | Returns the full object of the created Azure Firewall. |
| name | string | Returns the name of the created Azure Firewall. |
| id | string | Returns the ID of the created Azure Firewall. | 
| az_firewall_config | map | Returns the Azure Firewall object with following attributes: <br> This is an old output kept for compatibility reason with v0.1 which might nolonger be supported in future versions. <br> It outputs: <br> - az_fw_name <br> -az_fw_id <br> -az_ipconfig <br> -az_object. |