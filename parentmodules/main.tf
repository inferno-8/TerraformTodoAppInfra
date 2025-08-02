
module "resourceg" {
  source              = "../modules/resourcegrp"
  resource_group_name = "rj008"
  location            = "Central India"
}

# module "stgacount_name" {
#   source = "../modules/stgacount_name"
#     resource_group_name = "rj008"
#     location            = "Central India"
#     stgacount_name      = "ramustorageaccount"

# }


# module "vnet" {
#   depends_on = [ module.resourceg ]
#   source = "../modules/vnet"
#     virtual_network_name = "ramuvnet1"
#     resource_group_name  = "rj008"
#     location             = "Central India"
# }

# module "subnet" {
#   depends_on = [ module.vnet ]
#   source = "../modules/subnet"
#     subnet_name          = "ramusubnet1"
#     resource_group_name  = "rj008"
#     virtual_network_name = "ramuvnet1"
#     location             = "Central India"
# }

# module "pip" {
#   depends_on = [ module.subnet ]
#   source = "../modules/publicIp"
#     resource_group_name = "rj008"
#     location            = "Central India"
#      publicIpname               = "pip-name1"
# }

# module "vm" {
#   depends_on = [module.subnet,module.pip, module.resourceg]
#   source     = "../modules/vm"
#   resource_group_name  = var.resource_group_name
#   location             = var.location
#   vm_name              = var.vm_name
#   vm_size              = var.vm_size
#   admin_username       = var.admin_username
#   admin_password       =var.admin_password
#   image_publisher      = var.image_publisher
#   image_offer          = var.image_offer
#   image_sku            =var.image_sku
#   image_version        = var.image_version
#   nic_name             = "nic-vm1"
#   vnet_name = "vm-ramuvnet1"
#   ipname    = "ramupip1"
#   subnet_name = "ramusubnet1"
# }


# module "mssql_server" {
#   depends_on = [ module.resourceg ]
#   source     = "../modules/mssql_server"
#   sqlServerName          = "ramusqlserver1"
#   resorceName            = "rj008"
#   location               = "Central India"
#   adminLogin             = "sqladmin"
#   adminpw                = "Ramuniwas@1234"

# }

# module "mssql_database" {
#   depends_on = [ module.mssql_server,module.resourceg ]
#   source     = "../modules/mssqldb"
#   dbname                = "ramudb1"
#   serverName            = "ramusqlserver1"
#   resourcename          = "rj008"

# }


# module "keyvault" {
#   source     = "../modules/key_vault"
#  kvname = "ramukv1"
#   resource = "rj008"
#   location = "Central India"
# }

# //todo :-----

# module "usernameSecret"{
#   depends_on = [ module.keyvault ]
#   source     = "../modules/keyvault_secret"
#   dummyuname = "sqladmin"
#   dummyPassword = "Ramuniwas@1234"

# }

# module "passwordSecret"{
#   depends_on = [ module.keyvault ]
#   source     = "../modules/keyvault_secret"
#   dummyuname = "sqladmin"
#   dummyPassword = "Ramuniwas@1234"

# }
