# azure/networking/vnet

Starter Azure virtual network module scaffold with a stable file layout and extension points for future networking features.

## Usage

```hcl
module "vnet" {
  source = "../../../../modules/azure/networking/vnet"

  name                = "acme-dev-core-vnet"
  resource_group_name = "rg-network-dev"
  location            = "southeastasia"
  address_space       = ["10.20.0.0/16"]
  create_vnet         = true
}
```

## Next Recommended Enhancements

- subnet definitions
- NSG associations
- route tables
- private DNS integration
