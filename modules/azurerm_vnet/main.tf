resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnet_name
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space
 
  dynamic "subnet" {
    for_each = each.value.subnet
    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes

    }
  }
  tags = {
    environment = "dev"
  }
}
