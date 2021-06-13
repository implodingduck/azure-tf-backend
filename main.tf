terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.62.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.1.0"
    }
  }
  backend "azurerm" {

  }
}

provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

module "backend" {
    for_each = toset( ["sbx", "prod"])
    source = "github.com/implodingduck/tfmodules//tfbackend"
    name = "${each.key}-azure-tf-demo"
    location = "East US"
}
