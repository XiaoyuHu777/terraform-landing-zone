resource "azurerm_resource_group" "landing_zone" {
  name     = "landing-zone-rg"
  location = var.location
}
