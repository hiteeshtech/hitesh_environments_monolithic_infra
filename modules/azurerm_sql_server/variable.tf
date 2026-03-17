variable "sql_server" {
  description = "SQL Server configuration"
  type        = map(object({
    name                         = string
    rg_name                      = string
    location                     = string
    version                      = string
    minimum_tls_version          = string
  }))
}

variable "key_vault_id" {
  description = "Key Vault ID for SQL credentials"
  type        = string
}
