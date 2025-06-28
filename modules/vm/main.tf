data "azurerm_public_ip" "ip" {
  name                = "pip-name1"
  resource_group_name = "rj008"
}

data "azurerm_subnet" "subnetdata" {
  name                 = "ramusubnet1"
  virtual_network_name = "ramuvnet1"
  resource_group_name  = "rj008"
}


resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    public_ip_address_id          = data.azurerm_public_ip.ip.id
    name                          = var.ipname
    subnet_id                     = data.azurerm_subnet.subnetdata.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = var.vm_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  size                            = var.vm_size
  admin_username                  =var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher # Published ID from Azure Marketplace
    offer     = var.image_offer     # Product ID from Azure Marketplace
    sku       = var.image_sku       # Plan ID from Azure Marketplace
    version   = var.image_version   # Version of the image
  }


  custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF
  )

}