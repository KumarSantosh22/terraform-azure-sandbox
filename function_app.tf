resource "azurerm_function_app" "af_func_durable" {
  name                       = "func-durable-${var.environment}"
  location                   = azurerm_resource_group.rg_sandbox.location
  resource_group_name        = azurerm_resource_group.rg_sandbox.name
  app_service_plan_id        = azurerm_app_service_plan.appserviceplan.id
  storage_account_name       = azurerm_storage_account.sa_sandbox.name
  storage_account_access_key = azurerm_storage_account.sa_sandbox.primary_access_key
  version                    = "~4"

  app_settings {
    FUNCTIONS_WORKER_RUNTIME = "dotnet-isolated"
  }

  site_config {
    use_32_bit_worker_process = false
  }
}