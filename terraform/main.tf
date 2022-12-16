# Configure the AzureRM provider
provider "azurerm" {
  features {}

  subscription_id = "db6c56e5-692e-4891-b8b9-07eaf09b5947"
  tenant_id = "9c5012c9-b616-44c2-a917-66814fbe3e87"
}

# Create a managed identity
resource "azurerm_user_assigned_identity" "csc8110-identity" {
  name                = "csc8110-identity"
  resource_group_name = "csc8110-resource-group"
  location            = "eastus2"
}

# Create a resource group
resource "azurerm_resource_group" "csc8110-resource-group" {
  name     = "csc8110-resource-group"
  location = "eastus2"
}

# Create container registry
resource "azurerm_container_registry" "csc8110-container-registry" {
  name                = "csc8110-container-registry"
  resource_group_name = "csc8110-resource-group"
  location            = "eastus2"
  sku                 = "standard"
}

# Create the kubernetes cluster names "csc8110"
resource "azurerm_kubernetes_cluster" "csc8110" {
  name                = "csc8110"
  location            = "eastus2"
  resource_group_name = "csc8110-resource-group"
  dns_prefix          = "csc8110-dns"

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_D2as_v4"
  }

  identity {
    type = "SystemAssigned"
  }
}
