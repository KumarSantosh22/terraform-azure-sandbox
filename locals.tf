locals {
  tags = {
    envionment = var.envionment,
    source     = var.tf_source
  }

  sql_connection_string = format(
    "Server=tcp:%s.database.windows.net,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.sandbox_mssql_server01.name,
    azurerm_mssql_database.sandbox_mssql_db01.name,
    azurerm_mssql_server.sandbox_mssql_server01.administrator_login,
    azurerm_mssql_server.sandbox_mssql_server01.administrator_login_password
  )
}
