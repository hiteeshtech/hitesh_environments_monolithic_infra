terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rgworkload"
    storage_account_name = "storageworkload1"
    container_name       = "containerworkload"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "57f45f6e-57b0-4116-b6e6-2366c1e0a95e"
}
