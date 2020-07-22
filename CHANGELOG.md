## v2.1 (July 2020)

FEATURES: 
* **new feature:**  Add support for Terraform 013 ([#9](https://github.com/aztfmod/terraform-azurerm-caf-azure-firewall/issues/9))

## v2.0 (March 2020)

FEATURES: 
* **new feature:**  Add support for azurerm 2.x and azurecaf providers ([#6](https://github.com/aztfmod/terraform-azurerm-caf-azure-firewall/issues/6))

IMPROVEMENTS:
* **improvement:**  Changing to resource_group_name instead of rg.

## v1.1 (January 2020)

FEATURES: 
* **new feature:**  Add support for naming convention ([#3](https://github.com/aztfmod/terraform-azurerm-caf-azure-firewall/issues/3))
* **new feature:**  Add examples ([#2](https://github.com/aztfmod/terraform-azurerm-caf-azure-firewall/issues/2))

IMPROVEMENTS:
* **improvement:**  Unifing input variable names accross CAF modules (resource_group_name -> rg,log_analytics_workspace_id -> la_workspace_id) ([#5](https://github.com/aztfmod/terraform-azurerm-caf-azure-firewall/issues/5))

BUGS:
* **bug fix:** Support for eventhub diagnostics is now optionnal ([#6](https://github.com/aztfmod/terraform-azurerm-caf-azure-firewall/issues/6)) 
