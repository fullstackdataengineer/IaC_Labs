# Define the Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "e0b9cada-61bc-4b5a-bd7a-52c606726b3b"
}

# Use the existing resource group
data "azurerm_resource_group" "student_group" {
  name = "IE_ST_BCSAI_CLOUD_STUDENT"
}

# Storage Account
resource "azurerm_storage_account" "instructor_storage" {
  name                     = "instructoriac1"
  resource_group_name      = data.azurerm_resource_group.student_group.name
  location                 = data.azurerm_resource_group.student_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
