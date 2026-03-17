module "resource_group" {
  source  = "../../modules/azurerm_resource_group"
  rg_name = var.rg_name
}

module "vnet" {
  source     = "../../modules/azurerm_vnet"
  vnet_name  = var.vnet_name
  depends_on = [module.resource_group]
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  public_ip  = var.public_ip
  depends_on = [module.vnet]
}

module "key_vault" {
  source     = "../../modules/azurerm_key_vault"
  key_vault  = var.key_vault
  depends_on = [module.resource_group]
}

module "vm" {
  source     = "../../modules/azurerm_vm"
  vms        = var.vms
  depends_on = [module.resource_group, module.vnet, module.public_ip, module.key_vault]
}

module "sql_server" {
  source       = "../../modules/azurerm_sql_server"
  sql_server   = var.sql_server
  depends_on   = [module.resource_group, module.key_vault]
  key_vault_id = module.key_vault.key_vault_ids["kv1"]
}

module "sql_database" {
  source        = "../../modules/azurerm_sql_database"
  sql_database  = var.sql_database
  depends_on    = [module.sql_server]
  sql_server_id = module.sql_server.sql_server_ids["sql1"]
}
