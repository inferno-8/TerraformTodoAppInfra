



resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sqlServerName
  resource_group_name          = var.resorceName
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.adminLogin
  administrator_login_password = var.adminpw
  minimum_tls_version          = "1.2"
}
