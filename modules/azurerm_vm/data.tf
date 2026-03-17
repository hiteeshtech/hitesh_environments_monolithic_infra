data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_rg_name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.public_ip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "admin_username" {
  for_each     = var.vms
  name         = each.value.admin_username_secret_name
  key_vault_id = each.value.key_vault_id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.vms
  name         = each.value.admin_password_secret_name
  key_vault_id = each.value.key_vault_id
}
