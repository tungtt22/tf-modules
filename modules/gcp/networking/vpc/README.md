# gcp/networking/vpc

Starter GCP VPC network module scaffold for this monorepo. The module is intentionally small so the team can evolve the contract incrementally.

## Usage

```hcl
module "vpc" {
  source = "../../../../modules/gcp/networking/vpc"

  name                    = "acme-dev-core-vpc"
  project_id              = "acme-dev"
  auto_create_subnetworks = false
  create_network          = true
}
```

## Next Recommended Enhancements

- subnet module composition
- firewall rule strategy
- Cloud NAT support
- shared VPC patterns
