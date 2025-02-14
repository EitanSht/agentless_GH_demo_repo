provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "D4D_Demo"
    storage_account_name = "iacstoragetf620"
    container_name       = "sensitivedata"
    key                  = "terraform.tfstate"
  }
}

data "azurerm_resource_group" "D4D_Demo" {
  name = "D4D_Demo"
}

data "azurerm_storage_account" "existing" {
  name                = "iacstoragetf714"
  resource_group_name = "D4D_Demo"
}


resource "azurerm_storage_account" "existing" {
  name                     = data.azurerm_storage_account.existing.name
  resource_group_name      = data.azurerm_storage_account.existing.resource_group_name
  location                 = data.azurerm_storage_account.existing.location
  account_tier             = data.azurerm_storage_account.existing.account_tier
  account_replication_type = data.azurerm_storage_account.existing.account_replication_type

  enable_https_traffic_only = false

  tags = {
    "mapping_tag" = "6640a28e-3add-420c-8ff6-70db87140086"
  }
}
