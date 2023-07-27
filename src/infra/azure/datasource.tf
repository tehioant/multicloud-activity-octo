data "azurerm_client_config" "current" {
}

data "azurerm_subscription" "PSAzure" {
  subscription_id = "8ac3928d-ce93-403b-b8ff-9511282367af"
}