rgs = {
  rg1 = {
    name     = "client_rg"
    location = "centralindia"
  }
}
vnets = {
  hub_vnet = {

    name                = "hub_vnet"
    location            = "centralindia"
    resource_group_name = "client_rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {

  subnet1 = {

    name                 = "fornted_subnet"
    resource_group_name  = "client_rg"
    virtual_network_name = "hub_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {

    name                 = "backend_subnet"
    resource_group_name  = "client_rg"
    virtual_network_name = "hub_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {

    name                 = "backend_subnet"
    resource_group_name  = "client_rg"
    virtual_network_name = "hub_vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }

  subnet4 = {

    name                 = "bastion_subnet"
    resource_group_name  = "client_rg"
    virtual_network_name = "hub_vnet"
    address_prefixes     = ["10.0.4.0/24"]
  }
}

pips = {
  pip1 = {
    name                = "frontend_pip"
    resource_group_name = "client_rg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "backend_pip"
    resource_group_name = "client_rg"
    location            = "centralindia"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

network_interface = {
  vm1 = {
    subnet_name          = "fornted_subnet"
    virtual_network_name = "hub_vnet"
    resource_group_name  = "client_rg"
    pip_name             = "frontend_pip"
  }
  vm2 = {
    subnet_name          = "backend_subnet"
    virtual_network_name = "hub_vnet"
    resource_group_name  = "client_rg"
    pip_name             = "backend_pip"
  }
}

vms = {
  vm1 = {
    nic_name                      = "fortend_nic"
    location                      = "centralindia"
    resource_group_name           = "client_rg"
    ip_configuration_name         = "internal"
    subnet_name                   = "fornted_subnet"
    vnets_name                    = "hub_vnet"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "frontend_pip"
    vm_name                       = "frontend_vm"
    vm_size                       = "Standard_B1s"
    admin_username                = "adminuser"
   
  }

  vm2 = {

    nic_name                      = "backend_nic"
    location                      = "centralindia"
    resource_group_name           = "client_rg"
    ip_configuration_name         = "internal"
    subnet_name                   = "backend_subnet"
    vnets_name                    = "hub_vnet"
    private_ip_address_allocation = "Dynamic"
    pip_name                      = "backend_pip"
    vm_name                       = "backend_vm"
    vm_size                       = "Standard_B1s"
    admin_username                = "adminuser"
    
  }

}

