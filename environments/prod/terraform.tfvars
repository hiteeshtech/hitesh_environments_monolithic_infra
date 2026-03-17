rg_name = {
  rg1 = {
    name       = "rachitargprod"
    location   = "centralindia"
    managed_by = "rachita owner"
    tags = {
      environment = "prod"
      project     = "monolithic-infra"
    }
  }
}

vnet_name = {
  vnet1 = {
    name          = "rachitavnet"
    location      = "centralindia"
    rg_name       = "rachitargprod"
    address_space = ["10.0.0.0/16"]
    tags = {
      environment = "prod"
      project     = "monolithic-infra"
    }
    subnet = [
      {
        name             = "rachitasubnet1"
        address_prefixes = ["10.0.3.0/24"]
      },
      {
        name             = "rachitasubnet2"
        address_prefixes = ["10.0.4.0/24"]
      }
    ]
  }
}

public_ip = {
  pip1 = {
    name              = "rachitapip1"
    rg_name           = "rachitargprod"
    location          = "centralindia"
    allocation_method = "Static"
  }

  pip2 = {
    name              = "rachitapip2"
    rg_name           = "rachitargprod"
    location          = "centralindia"
    allocation_method = "Static"
  }
}

key_vault = {
  kv1 = {
    name     = "rachitakvprod"
    location = "centralindia"
    rg_name  = "rachitargprod"
  }
}

vms = {
  frontend = {
    name                       = "rachitafrontendvm"
    location                   = "centralindia"
    rg_name                    = "rachitargprod"
    size                       = "Standard_D2s_v3"
    vnet_name                  = "rachitavnet"
    vnet_rg_name               = "rachitargprod"
    subnet_name                = "rachitasubnet1"
    public_ip_name             = "rachitapip1"
    key_vault_id               = "/subscriptions/57f45f6e-57b0-4116-b6e6-2366c1e0a95e/resourceGroups/rachitargprod/providers/Microsoft.KeyVault/vaults/rachitakvprod"
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
    rg_name                    = "rachitargprod"
    size                       = "Standard_D2s_v3"
    vnet_name                  = "rachitavnet"
    vnet_rg_name               = "rachitargprod"
    subnet_name                = "rachitasubnet2"
    public_ip_name             = "rachitapip2"
    key_vault_id               = "/subscriptions/57f45f6e-57b0-4116-b6e6-2366c1e0a95e/resourceGroups/rachitargprod/providers/Microsoft.KeyVault/vaults/rachitakvprod"
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
    name                = "rachitasqlserverprod"
    rg_name             = "rachitargprod"
    location            = "centralindia"
    version             = "12.0"
    minimum_tls_version = "1.2"
  }
}

sql_database = {
  sqld = {
    name         = "rachitasqldbaseprod"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 100
    sku_name     = "S2"
    enclave_type = "VBS"
  }
}
