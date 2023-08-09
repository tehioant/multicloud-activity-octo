resource "azurerm_storage_account" "alltribes_sa" {
  name                      = "ochoninjaaccess"
  resource_group_name       = azurerm_resource_group.rg_alltribes.name
  account_replication_type  = "LRS"
  account_tier              = "Standard"
  location                  = azurerm_resource_group.rg_alltribes.location
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  tags                      = local.mandatoryTags
}

resource "azurerm_service_plan" "alltribes_sp" {
  name                = "ocho-ninja-admin"
  resource_group_name = azurerm_resource_group.rg_alltribes.name
  location            = azurerm_resource_group.rg_alltribes.location
  os_type             = "Linux"
  sku_name            = "Y1" # Consumption Plan
  tags                = local.mandatoryTags
}

resource "azurerm_linux_function_app" "alltribes_azf" {
  name                       = "alltribes-azf"
  resource_group_name        = azurerm_resource_group.rg_alltribes.name
  location                   = azurerm_resource_group.rg_alltribes.location
  storage_account_name       = azurerm_storage_account.alltribes_sa.name
  storage_account_access_key = azurerm_storage_account.alltribes_sa.primary_access_key
  service_plan_id            = azurerm_service_plan.alltribes_sp.id
  tags                       = local.mandatoryTags

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    WEBSITE_RUN_FROM_PACKAGE            = "1"
    AAD_DOMAIN_MAIL                     = "@ocho.ninja"
    TENANT_ID                           = data.azurerm_client_config.current.tenant_id
  }

  site_config {
    always_on     = false
    http2_enabled = true
    application_stack {
      node_version = "18"
    }
  }
}