/* Create vNet
------------------------------------------------------------------*/
resource "azurerm_virtual_network" "vnet" {
    name = join("", [var.globals.env,"CNR","-",var.globals.project,"-","vnet"])
    provider = azurerm.sub
    location = "canadaCentral"
    address_space = [var.vnet]
    resource_group_name = azurerm_resource_group.network-rg.name
    tags = var.globals.tags
}
