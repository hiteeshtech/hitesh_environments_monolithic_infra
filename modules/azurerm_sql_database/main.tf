resource "azurerm_mssql_database" "sqldatabase" {
  for_each     = var.sql_database
  name         = each.value.name
  server_id    = var.sql_server_id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type

  tags = {
    environment = "dev"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

