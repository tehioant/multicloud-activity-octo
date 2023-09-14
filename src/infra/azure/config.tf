terraform {
  required_version = "1.5.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.66.0"
    }
  }

  backend "azurerm" {
    container_name       = "terraform"
    key                  = "azure/terraform.tfstate"
    resource_group_name  = "tribes-day"
    storage_account_name = "tdtfstate"
    subscription_id      = "8ac3928d-ce93-403b-b8ff-9511282367af"
    tenant_id            = "af22c6ec-bb59-46c1-b14e-b0335ee947a2"
  }
}

provider "azurerm" {
  features {}
}