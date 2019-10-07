#Reference: https://www.terraform.io/docs/providers/azurerm/r/firewall.html 

resource "azurerm_firewall" "az_firewall" {
  name                = var.az_fw_name
  location            = var.location 
  resource_group_name = var.az_fw_rg
  tags                = local.tags

  ip_configuration {
    name                 = "az_firewall_ip_configuration"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
}