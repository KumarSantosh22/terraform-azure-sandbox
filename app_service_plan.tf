resource "azurerm_app_service_plan" "appserviceplan" {
  name                = "as-${var.environment}-sandbox"
  location            = azurerm_resource_group.rg_sandbox.location
  resource_group_name = azurerm_resource_group.rg_sandbox.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}