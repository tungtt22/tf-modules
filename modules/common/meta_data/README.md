# common/meta_data

Provider-agnostic metadata helper for multi-cloud modules. It standardizes governance-oriented tags and labels while staying independent of any specific cloud provider.

## Why This Exists

`common/context` gives you a compact shared context for names and tags. `common/meta_data` extends that with broader metadata fields often needed across teams, such as cost center and data classification.

## Usage

```hcl
module "meta_data" {
  source = "../../../modules/common/meta_data"

  context             = module.context.context
  cost_center         = "cc-1234"
  business_unit       = "platform"
  data_classification = "internal"
}
```

## Outputs

- `name`: canonical name
- `tags`: merged metadata map for providers using tags
- `labels`: merged metadata map for providers using labels
- `metadata`: normalized metadata object
