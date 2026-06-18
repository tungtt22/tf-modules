# common/context

Provider-agnostic helper module for naming and metadata. Use this module to generate consistent names, tags, and a shared context object across AWS, Azure, and GCP modules.

## Usage

```hcl
module "context" {
  source = "../../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "payments"
  owner       = "platform-team"
  attributes  = ["api"]
  tags = {
    cost_center = "finops"
  }
}
```

## Outputs

- `name`: normalized resource prefix
- `tags`: merged metadata map
- `context`: full reusable context object
