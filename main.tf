resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "PR2-CI" {
depends_on = [ var.resource_group_name ]
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.storage_account_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

terraform {
  backend "azurerm" {
    resource_group_name  = "yamlrg"
    storage_account_name = "yamlstrg"
    container_name       = "yamlcontainer"
    key                  = "terraform.tfstate"
  }
}
