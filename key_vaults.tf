# key-vault
resource "azurerm_key_vault" "sandbox_key_vault" {
  name                       = "kv-${var.environment}-sandbox"
  location                   = azurerm_resource_group.rg_sandbox.location
  resource_group_name        = azurerm_resource_group.rg_sandbox.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  tags                       = local.tags

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }

  access_policy {
    tenant_id = azurerm_user_assigned_identity.uai_sandbox_db.tenant_id
    object_id = azurerm_user_assigned_identity.uai_sandbox_db.principal_id

    key_permissions = ["Get", "WrapKey", "UnwrapKey"]
  }
}
