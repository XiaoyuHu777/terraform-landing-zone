resource "azurerm_linux_virtual_machine" "myVM" {
  name                = "myVM"
  resource_group_name = "myResourceGroup"
  location            = "East US"
  size                = "Standard_DS1_v2"
  admin_username      = "azureuser"

  network_interface_ids = [
    "/subscriptions/b4853414-5bc5-4ac4-8b75-b8cdc9406663/resourceGroups/myResourceGroup/providers/Microsoft.Network/networkInterfaces/myVMVMNic"
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyAHCeWlGfpf8rkPel7IU0KglgATEsLppVryZKYqtkt/H2KR5GwNvhlbfsRDv+FgBkLybStYMgkXygMh46OUcxvw/zJuZXx46n0MF8utBszwQ6/p4K1u1FGvcWwCjwo+WjcRLf4NadwciE9qfFQQg0j66o2FHH10/0fgMJlAyPoAJnYBtIDIPczP2JsmZl7GLWFz1f+P0KfE9ZHIcJPIiRC+RTCm/u8aqsQPwb34yxq249GMEWmB5Tz8SIjI9LWLJvCRTvHAn4cxKWyqBViOM/0hAChf4CdQBrQV5FrNGm51pU6Ug8xVIIFwUKsss6vfmj6tfVL5oGeAeZycofoFqD"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "myVM_disk1_38ad6b9ebd3a471faa6602130c02237f"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  provision_vm_agent = true

  tags = {}
}
