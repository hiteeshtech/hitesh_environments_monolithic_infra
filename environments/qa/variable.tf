variable "rg_name" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "vnet_name" {
  description = "A map of virtual network names to create"
  type = map(object({
    name          = string
    location      = string
    rg_name       = string
    address_space = list(string)
    tags          = map(string)
    subnet = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}

variable "public_ip" {
  type = map(object({
    name              = string
    rg_name           = string
    location          = string
    allocation_method = string
    tags              = optional(map(string))
  }))
}

variable "key_vault" {
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    tags     = optional(map(string))
  }))
}

variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    name     = string
    location = string
    rg_name  = string
    size     = string

    vnet_name      = string
    vnet_rg_name   = string
    subnet_name    = string
    public_ip_name = string

    key_vault_id               = string
    admin_username_secret_name = string
    admin_password_secret_name = string

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "sql_server" {
  description = "SQL Server configuration"
  type = map(object({
    name                = string
    rg_name             = string
    location            = string
    version             = string
    minimum_tls_version = string
  }))
}

variable "sql_database" {
  type = map(object({
    name         = string
    # server_id    = string
    collation    = string
    license_type = string
    max_size_gb  = number
    sku_name     = string
    enclave_type = string
  }))
}
