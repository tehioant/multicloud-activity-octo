terraform {
  required_version = "=1.4.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.52.0"
    }
  }
  backend "azurerm" {
    container_name       = "tfstates-admin"
    storage_account_name = "ochoninjatfstates"
    key                  = "admin.tfstate"
    resource_group_name  = "rg-reserved"
  }
}



provider "azurerm" {
  features {}
}