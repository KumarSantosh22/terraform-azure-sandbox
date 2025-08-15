terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstates"
    storage_account_name = "sa-tfstates"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  key_vault {
    purge_soft_deleted_secrets_on_destroy = true
    recover_soft_deleted_secrets          = true
  }

  # client_id       = "00000000-0000-0000-0000-000000000000"
  # client_secret   = var.client_secret
  # tenant_id       = "10000000-0000-0000-0000-000000000000"
  # subscription_id = "20000000-0000-0000-0000-000000000000"
}

data "azurerm_client_config" "current" {}
