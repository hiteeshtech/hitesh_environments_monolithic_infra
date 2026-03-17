resource "azurerm_mssql_server" "sqlserver" {
  for_each                     = var.sql_server
  name                         = each.value.name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.sql_admin_username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.sql_admin_password[each.key].value
  minimum_tls_version          = each.value.minimum_tls_version

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "00000000-0000-0000-0000-000000000000"
#   }

  tags = {
    environment = "dev"   
  }
}

