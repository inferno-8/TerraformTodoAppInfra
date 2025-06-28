


data "azurerm_mssql_server" "myserver" {
  name                = var.serverName
  resource_group_name = var.resourcename
}


resource "azurerm_mssql_database" "mysqldb" {
  name         = var.dbname
  server_id    = data.azurerm_mssql_server.myserver.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

}

