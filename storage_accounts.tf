resource "azurerm_storage_account" "sa_sandbox" {
  name                     = "sa-${var.environment}-sandbox"
  resource_group_name      = azurerm_resource_group.rg_sandbox.name
  location                 = azurerm_resource_group.rg_sandbox.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}