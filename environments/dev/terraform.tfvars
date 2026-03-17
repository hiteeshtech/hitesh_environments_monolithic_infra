rg_name = {
  rg1 = {
    name       = "rachitargdev"
    location   = "centralindia"
    managed_by = "rachita owner"
    tags = {
      environment = "dev"
      project     = "monolithic-infra"
    }
  }
}

vnet_name = {
  vnet1 = {
    name          = "rachitavnet"
    location      = "centralindia"
    rg_name       = "rachitargdev"
    address_space = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
      project     = "monolithic-infra"
    }
    subnet = [
      {
        name             = "rachitasubnet1"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "rachitasubnet2"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ip = {
  pip1 = {
    name              = "rachitapip1"
    rg_name           = "rachitargdev"
    location          = "centralindia"
    allocation_method = "Static"
  }

  pip2 = {
    name              = "rachitapip2"
    rg_name           = "rachitargdev"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

key_vault = {
  kv1 = {
    name     = "rachitakvdev"
    location = "centralindia"
    rg_name  = "rachitargdev"
  }
}

vms = {
  frontend = {
    name                       = "rachitafrontendvm"
    location                   = "centralindia"
    rg_name                    = "rachitargdev"
    size                       = "Standard_D2s_v3"
    vnet_name                  = "rachitavnet"
    vnet_rg_name               = "rachitargdev"
    subnet_name                = "rachitasubnet1"
    public_ip_name             = "rachitapip1"
    key_vault_id               = "/subscriptions/57f45f6e-57b0-4116-b6e6-2366c1e0a95e/resourceGroups/rachitargdev/providers/Microsoft.KeyVault/vaults/rachitakvdev"
    admin_username_secret_name = "vm-admin-username"
    admin_password_secret_name = "vm-admin-password"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }

  backend = {
    name                       = "rachitabackendvm"
    location                   = "centralindia"
    rg_name                    = "rachitargdev"
    size                       = "Standard_D2s_v3"
    vnet_name                  = "rachitavnet"
    vnet_rg_name               = "rachitargdev"
    subnet_name                = "rachitasubnet2"
    public_ip_name             = "rachitapip2"
    key_vault_id               = "/subscriptions/57f45f6e-57b0-4116-b6e6-2366c1e0a95e/resourceGroups/rachitargdev/providers/Microsoft.KeyVault/vaults/rachitakvdev"
    admin_username_secret_name = "vm-admin-username"
    admin_password_secret_name = "vm-admin-password"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
  }
}

sql_server = {
  sql1 = {
    name                = "rachitasqlserver"
    rg_name             = "rachitargdev"
    location            = "centralindia"
    version             = "12.0"
    minimum_tls_version = "1.2"
  }
}

sql_database = {
  sqld = {
    name         = "rachitasqldb"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 100
    sku_name     = "S2"
    enclave_type = "VBS"
  }
}
