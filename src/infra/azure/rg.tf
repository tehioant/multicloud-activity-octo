resource "azurerm_resource_group" "rgalltribes" {
  name     = "rg-alltribes"
  location = local.location
  tags = local.mandatoryTags
}