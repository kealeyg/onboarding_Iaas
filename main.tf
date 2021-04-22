/* Config
------------------------------------------------------------------*/
variable "globals" {}
provider "azurerm" { alias = "sub" }
variable "keyvault" {}
variable "vnet" {}
variable "snet" {}
variable "core" {}
variable "core2" {}

data "azurerm_client_config" "current" {provider = azurerm.sub}

/* Output
------------------------------------------------------------------*/
output "moduleOutput" {
    value =  {
        "nexthop" = cidrhost(var.core,1066)
    }
}