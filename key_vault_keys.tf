resource "azurerm_key_vault_key" "kv_key_uai" {
  depends_on = [azurerm_key_vault]

  name         = "example-key"
  key_vault_id = azurerm_key_vault.sandbox_key_vault.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = ["unwrapKey", "wrapKey"]
}