# key vault secrets

resource "azurerm_key_vault_secret" "test" {
  name         = "secret-sauce"
  value        = "szechuan"
  key_vault_id = azurerm_key_vault.sandbox_key_vault.id
}