terraform {
  required_version = "1.5.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }
  backend "azurerm" {
    container_name       = "tfstates-tribeday"
    storage_account_name = "tribedayfstates"
    key                  = "azure.tfstate"
    resource_group_name  = "rg-tribe-day"
  }
}

provider "azurerm" {
  features {}
}