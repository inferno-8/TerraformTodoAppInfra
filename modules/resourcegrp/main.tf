resource "azurerm_resource_group" "rj" {
  name     = var.resource_group_name
  location = var.location
}