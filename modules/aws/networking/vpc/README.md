# aws/networking/vpc

Starter AWS VPC module scaffold. The structure is production-ready for extension, but the default behavior keeps resource creation disabled until the interface is finalized.

## Current Scope

- standard module skeleton
- typed inputs and outputs
- optional VPC creation toggle
- ready to extend with subnets, route tables, NAT, and endpoints

## Usage

```hcl
module "vpc" {
  source = "../../../../modules/aws/networking/vpc"

  name       = "acme-dev-core"
  cidr_block = "10.10.0.0/16"
  create_vpc = true
  tags = {
    environment = "dev"
  }
}
```

## Next Recommended Enhancements

- private and public subnet maps
- internet gateway support
- route tables
- NAT strategy
- VPC flow logs
