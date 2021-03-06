/* Create RG
------------------------------------------------------------------*/
resource "azurerm_resource_group" "system-rg" {
    name = join("", [var.globals.env,"-",var.globals.group,"-",var.globals.project,"-","System","-","rg"])
    location = "canadaCentral"
    provider = azurerm.sub
    tags = var.globals.tags
}

resource "azurerm_resource_group" "network-rg" {
    name = join("", [var.globals.env,"-",var.globals.group,"-",var.globals.project,"-","Network","-","rg"])
    location = "canadaCentral"
    provider = azurerm.sub
    tags = var.globals.tags
}