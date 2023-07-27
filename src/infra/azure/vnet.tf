resource "azurerm_network_security_group" "alltribes_sg" {
  name                = "alltribes-security-group"
  location            = azurerm_resource_group.rg_alltribes.location
  resource_group_name = azurerm_resource_group.rg_alltribes.name
}

resource "azurerm_virtual_network" "alltribes_vnet" {
  name                = "alltribes-network"
  location            = azurerm_resource_group.rg_alltribes.location
  resource_group_name = azurerm_resource_group.rg_alltribes.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.alltribes_sg.id
  }

  tags = {
    Owner = "ante"
    environment = "Production"
  }
}