resource "azurerm_resource_group" "rgalltribes" {
  name     = "rg-alltribes"
  location = "West Europe"
  tags = local.mandatoryTags
}