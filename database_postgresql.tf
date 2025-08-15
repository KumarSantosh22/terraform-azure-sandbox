resource "azurerm_postgresql_server" "pgsql_server_sandbox" {
  name                = "postgresql-server-1"
  location            = azurerm_resource_group.rg_sandbox.location
  resource_group_name = azurerm_resource_group.rg_sandbox.name

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = true
}

resource "azurerm_postgresql_database" "pgsql_db" {
  name                = "${var.environment}-pgsqleb01"
  resource_group_name = azurerm_resource_group.rg_sandbox.name
  server_name         = azurerm_postgresql_server.rg_sandbox.name
  charset             = "UTF8"
  collation           = "English_United States.1252"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}