# mssql server
resource "azurerm_mssql_server" "sandbox_mssql_server01" {
  name                         = "${var.environment}-sqlserver-01"
  resource_group_name          = azurerm_resource_group.rg_sandbox.name
  location                     = azurerm_resource_group.rg_sandbox.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "sandbox_mssql_db01" {
  name         = "sandbox-db01"
  server_id    = azurerm_mssql_server.sandbox_mssql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = local.tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

# mssql server with user assgined identity
resource "azurerm_mssql_server" "sandbox_mssql_server02" {
  name                         = "${var.environment}-sqlserver-02"
  resource_group_name          = azurerm_resource_group.rg_sandbox.name
  location                     = azurerm_resource_group.rg_sandbox.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_mssql_database" "sandbox_mssql_db02" {
  name           = "sandbox-db02"
  server_id      = azurerm_mssql_server.sandbox_mssql_server02.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
  enclave_type   = "VBS"

  tags = local.tags

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uai_sandbox_db.id]
  }

  transparent_data_encryption_key_vault_key_id = azurerm_key_vault_key.sandbox_key_vault.id

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}