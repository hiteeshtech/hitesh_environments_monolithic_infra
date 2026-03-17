variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    name       = string
    location   = string
    rg_name    = string
    size       = string

    # Networking
    vnet_name      = string
    vnet_rg_name   = string
    subnet_name    = string
    public_ip_name = string

    # Key Vault
    key_vault_id                     = string
    admin_username_secret_name       = string
    admin_password_secret_name       = string

    # Image
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
