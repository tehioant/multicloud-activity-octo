terraform {
  required_version = "1.5.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  location = "francecentral"
}

resource "azurerm_resource_group" "reserved" {
  name     = "rg-tribe-day"
  location = local.location

  tags = {
    owner        = "ante"
    restrictedTo = "ante"
    contact      = "ante@ocho.ninja"
  }
}

resource "azurerm_storage_account" "backend" {
  name                     = "tribedayfstates"
  resource_group_name      = azurerm_resource_group.reserved.name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "BlobStorage"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "admin_container" {
  name                  = "tfstates-tribeday"
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}