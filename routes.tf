resource "azurerm_route_table" "rt" {
    name = join("", [var.globals.env,"CNR","-",var.globals.project,"-","rt"])
    provider = azurerm.sub
    resource_group_name = azurerm_resource_group.network-rg.name
    location = "canadaCentral"
    disable_bgp_route_propagation = false
    route {
        name = "toCoreFW-Dev-Internet-route"
        address_prefix = "0.0.0.0/0"
        next_hop_in_ip_address = cidrhost(var.core,1066)
        next_hop_type = "VirtualAppliance"
    }
    route {
        name = "toCoreFW-Dev-Core-route"
        address_prefix = var.core
        next_hop_in_ip_address = cidrhost(var.core,1066)
        next_hop_type = "VirtualAppliance"
    }
    route {
        name = "toCoreFW-Dev-Core2-route"
        address_prefix = var.core
        next_hop_in_ip_address = cidrhost(var.core2,1066) 
        next_hop_type = "VirtualAppliance"
    }
    tags = var.globals.tags
}

resource "azurerm_subnet_route_table_association" "snet-rt-association" {
    count = length(var.snet)
    provider = azurerm.sub
    subnet_id = element(azurerm_subnet.snet.*.id, count.index)
    route_table_id = azurerm_route_table.rt.id
}

