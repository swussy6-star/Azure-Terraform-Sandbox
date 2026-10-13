terraform{
    required_providers{
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }

	backend "azurerm"{
		resource_group_name = "rg-statefile-storage"
		storage_account_name = "stat6577efilestorage"
		container_name = "tfstate"
		key = "terraform.tfstate"

	}

}

provider "azurerm"{
    features {}
    subscription_id = "c76631db-bb63-48d4-a4c1-da071fd12a83"
}

resource "azurerm_resource_group" "sandbox_rg"{
    name = "rg-terraform-sandbox"
    location = "eastus"
}

resource "azurerm_virtual_network" "sandbox_vnet"{
    name = "vnet-sandbox"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.sandbox_rg.location
    resource_group_name = azurerm_resource_group.sandbox_rg.name
}

