data "azurerm_key_vault_secret" "sql_admin_username" {
  for_each     = var.sql_server
  name         = "mssql-admin-username"
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  for_each     = var.sql_server
  name         = "mssql-admin-password"
  key_vault_id = var.key_vault_id
}
