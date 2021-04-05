resource "azurerm_subnet" "snet" {
    count = length(var.snet)
    name     = join("", [var.globals.env,"CNR","-",var.globals.project,"-", "subnet", count.index,"-","snet"])
    provider = azurerm.sub
    address_prefixes = [element(var.snet, count.index)]
    resource_group_name = azurerm_resource_group.network-rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_subnet_network_security_group_association" "snet-nsg-association" {
    count = length(var.snet)
    provider = azurerm.sub
    subnet_id = element(azurerm_subnet.snet.*.id, count.index)
    network_security_group_id = azurerm_network_security_group.nsg.id
}
