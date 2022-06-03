# ---------------------------------------------------------------------------------------------------------------------
# Create Core Resource Group
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_resource_group" "rg_core"{
  provider = azurerm.spoke  
  name     = var.core_resource_group_name
  location = var.core_resource_group_location
}

# ---------------------------------------------------------------------------------------------------------------------
# Create Core Resource Group Resources
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_virtual_network" "spoke_vnet" {
  provider = azurerm.spoke
  name                = "spoke_vnet"
  location            = azurerm_resource_group.rg_core.location
  resource_group_name = azurerm_resource_group.rg_core.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  subnet {
    name           = "subnet1"
    address_prefix = var.address_prefix_subnet
  }

}

# ---------------------------------------------------------------------------------------------------------------------
# Peer Spoke & Hub Virtual Networks
# ---------------------------------------------------------------------------------------------------------------------
resource "azurerm_virtual_network_peering" "peer_spoke_to_hub" {
  provider = azurerm.spoke
  name                      = "spoke_to_hub"
  resource_group_name       = azurerm_resource_group.rg_core.name
  virtual_network_name      = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id = var.hub_virtual_network_id
}

resource "azurerm_virtual_network_peering" "peer_hub_to_spoke" {
  provider = azurerm.hub
  name                      = "hub_to_spoke_${var.location}_${var.environment}_${var.client_tla}"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_virtual_network_name
  remote_virtual_network_id = azurerm_virtual_network.spoke_vnet.id
}