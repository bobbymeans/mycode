terraform {
    required_providers {
        null = {
            source = "hashicorp/null"
            version = "3.1.1"
        }
    }
}

provider "null" {
    # configuration options
}

locals {
  rgs = {
    "alpha" = { "region" = "eastus"
                "vnet" = "omega" }
    "bravo" = { "region" = "southindia"
                "vnet" = "psi" }
    "charlie" = { "region" = "westus"
                    "vnet" = "chi" }
  }
}

resource "null_resource" "dummy_args" {
    for_each = tomap(local.rgs)

    triggers = {
        name = each.key
        region = each.value.region
    }
}

resource "null_resource" "dummy_vnets" {
    for_each = tomap(local.rgs)
    
    triggers = {
        name = each.value.vnet
        region = each.value.region
        rg = each.key
    }
}
