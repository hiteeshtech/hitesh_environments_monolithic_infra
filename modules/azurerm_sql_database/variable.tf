variable "sql_database" {
  type = map(object({
    name         = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}

variable "sql_server_id" {
  type = string
}
