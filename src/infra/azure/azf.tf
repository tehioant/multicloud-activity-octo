resource "azurerm_storage_account" "sa_all_tribes" {
  name                     = "saalltribesday"
  resource_group_name      = azurerm_resource_group.rgalltribes.name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "sp_all_tribes" {
  name                = "sp-all-tribes"
  location            = local.location
  resource_group_name = azurerm_resource_group.rgalltribes.name

  os_type  = "Linux"
  sku_name = "P1v2"
}

resource "azurerm_linux_function_app" "azf_all_tribes" {
  name                       = "azf-all-tribes"
  location                   = local.location
  resource_group_name        = azurerm_resource_group.rgalltribes.name
  service_plan_id            = azurerm_service_plan.sp_all_tribes.id
  storage_account_name       = azurerm_storage_account.sa_all_tribes.name
  storage_account_access_key = azurerm_storage_account.sa_all_tribes.primary_access_key
  site_config {}
}