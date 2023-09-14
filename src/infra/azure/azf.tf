resource "azurerm_storage_account" "sa_all_tribes" {
  name                     = "saalltribesday"
  resource_group_name      = azurerm_resource_group.rgalltribes.name
  location                 = azurerm_resource_group.rgalltribes.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "sp_all_tribes" {
  name                = "sp-all-tribes"
  location            = azurerm_resource_group.rgalltribes.location
  resource_group_name = azurerm_resource_group.rgalltribes.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_function_app" "azf_all_tribes" {
  name                       = "azf-all-tribes"
  location                   = azurerm_resource_group.rgalltribes.location
  resource_group_name        = azurerm_resource_group.rgalltribes.name
  app_service_plan_id        = azurerm_app_service_plan.sp_all_tribes.id
  storage_account_name       = azurerm_storage_account.sa_all_tribes.name
  storage_account_access_key = azurerm_storage_account.sa_all_tribes.primary_access_key
}