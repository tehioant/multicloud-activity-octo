resource "azurerm_network_security_group" "alltribes_sg" {
  name                = "alltribes-security-group"
  location            = azurerm_resource_group.rgalltribes.location
  resource_group_name = azurerm_resource_group.rgalltribes.name
}

resource "azurerm_virtual_network" "alltribes_vnet" {
  name                = "tribes-day"
  location            = azurerm_resource_group.rgalltribes.location
  resource_group_name = azurerm_resource_group.rgalltribes.name
  address_space       = ["10.1.0.0/16"]

  subnet {
    name           = "default"
    address_prefix = "10.1.0.0/24"
  }

  subnet {
    name           = "GatewaySubnet"
    address_prefix = "10.1.2.0/24"
    security_group = azurerm_network_security_group.alltribes_sg.id
  }

    subnet {
    name           = "vpn-subnet"
    address_prefix = "10.1.1.0/24"
    security_group = azurerm_network_security_group.alltribes_sg.id
  }

  tags = {
    Owner = "tribes"
    environment = "Production"
  }
}