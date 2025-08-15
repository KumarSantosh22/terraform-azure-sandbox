resource "azurerm_resource_group" "rg_sandbox" {
  name     = "rg-${var.environment}-tfsandbox"
  location = var.location
  tags     = local.tags
}