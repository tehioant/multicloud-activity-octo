resource "azurerm_resource_group" "rg_alltribes" {
  name     = "rg-alltribes"
  location = local.location
}