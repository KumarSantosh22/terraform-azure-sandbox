resource "azurerm_user_assigned_identity" "uai_sandbox_db" {
  name                = "sandbox-admin"
  location            = azurerm_resource_group.rg_sandbox.location
  resource_group_name = azurerm_resource_group.rg_sandbox.name
}
