data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "PSAzure" {
  subscription_id = "8ac3928d-ce93-403b-b8ff-9511282367af"
}

data "azurerm_resource_group" "rg_reserved" {
  name = "rg-reserved"
}

data "azurerm_function_app_host_keys" "MattermostAlerts" {
  name                = azurerm_linux_function_app.MattermostAlerts.name
  resource_group_name = data.azurerm_resource_group.rg_reserved.name
}

data "azurerm_policy_definition" "policy_tag_owner" {
  display_name = "Require a tag on resources"
}