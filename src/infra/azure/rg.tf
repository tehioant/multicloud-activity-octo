resource "azurerm_resource_group" "rgalltribes" {
  name     = "rg-alltribes"
  location = "West Europe" # I fucked up
  tags = local.mandatoryTags
}