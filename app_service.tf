resource "azurerm_app_service" "app_service_plan" {
  name                = "app-service-${var.environment}"
  location            = azurerm_resource_group.rg_sandbox.location
  resource_group_name = azurerm_resource_group.rg_sandbox.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLServer"
    value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  }
}