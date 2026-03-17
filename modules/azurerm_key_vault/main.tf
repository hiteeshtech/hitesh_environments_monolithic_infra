data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv" {
  for_each                    = var.key_vault
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get", "List", "Set", "Delete", "Backup", "Restore", "Recover", "Purge"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
