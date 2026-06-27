# common/name

Provider-agnostic naming helper for multi-cloud modules. It builds canonical names from shared context plus optional resource-specific parts.

## Design Goals

- work across AWS, Azure, and GCP
- avoid provider-specific abbreviations in the common layer
- support both direct inputs and `common/context` output

## Usage

```hcl
module "name" {
  source = "../../../modules/common/name"

  context       = module.context.context
  resource_type = "vnet"
  suffix        = "core"
}
```

## Outputs

- `value`: rendered canonical name
- `parts`: name parts that were used to build the final value
