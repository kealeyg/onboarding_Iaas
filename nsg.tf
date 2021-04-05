resource "azurerm_network_security_group" "nsg" {
    name = join("", [var.globals.env,"CNR","-",var.globals.project,"-","nsg"])
    provider = azurerm.sub
    location = "canadaCentral"
    resource_group_name = azurerm_resource_group.network-rg.name
    security_rule {
        name = "Allow_MAZ_JumpServer"
        priority = "100"
        direction = "Inbound"
        access = "Allow"
        protocol = "Tcp"
        source_port_range = "*"
        destination_port_ranges = ["3389","22"]
        source_address_prefixes = [cidrhost(var.core, 11),cidrhost(var.core, 10)]
        destination_address_prefix = "*"
        description = "Allow_MAZ_JumpServer"
    }
    tags = var.globals.tags
}
