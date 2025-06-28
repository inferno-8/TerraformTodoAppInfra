resource "azurerm_key_vault_secret" "example" {
  name         =var.dummyuname
  value        = var.dummyPassword
  key_vault_id =  data.azurerm_key_vault.example.id
}


data "azurerm_key_vault" "example" {
  name                = "ramukv1"
  resource_group_name = "rj008"
}
