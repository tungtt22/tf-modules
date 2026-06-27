# Terraform Modules Monorepo

Reusable Terraform modules for multi-cloud infrastructure, organized so teams can discover, use, test, and contribute consistently.

## Goals

- Support multiple clouds without mixing provider-specific concerns.
- Keep every module self-documented and example-driven.
- Make contribution standards obvious for new maintainers.
- Provide a stable repository layout that can grow over time.

## Repository Layout

```text
tf-modules/
├── .github/                    # CI, PR template, issue templates
├── .agents/                    # Focused AI reviewer/author profiles
├── docs/                       # Architecture, authoring, contribution docs
├── examples/                   # Runnable examples grouped by cloud/domain
├── modules/
│   ├── common/                 # Provider-agnostic modules
│   ├── aws/                    # AWS modules by domain
│   ├── azure/                  # Azure modules by domain
│   └── gcp/                    # GCP modules by domain
├── scripts/harness/            # AI-friendly validation and discovery scripts
├── AGENTS.md                   # Cross-tool AI operating guide
├── CONTRIBUTING.md             # How to contribute safely and consistently
├── SECURITY.md                 # Security reporting and secure authoring rules
├── SKILL.md                    # Codex-style project skill
├── Makefile                    # Common local workflows
└── README.md
```

## Module Naming Convention

Use the following path pattern:

```text
modules/<cloud-or-common>/<domain>/<module-name>
```

Examples:

- `modules/common/context`
- `modules/aws/networking/vpc`
- `modules/azure/networking/vnet`
- `modules/gcp/networking/vpc`

This keeps provider-specific implementations isolated while allowing shared conventions across all modules.

## Quick Start

1. Choose a module under `modules/`.
2. Review its local `README.md`.
3. Start from the closest example in `examples/`.
4. Copy the example into your own Terraform stack and adapt inputs.

Example:

```hcl
module "context" {
  source = "../../modules/common/context"

  namespace   = "acme"
  environment = "dev"
  application = "payments"
  owner       = "platform-team"
}
```

## Available Starter Modules

| Cloud | Module | Purpose |
| --- | --- | --- |
| Common | `common/context` | Shared naming, labels, tags, metadata |
| Common | `common/name` | Provider-agnostic canonical name builder |
| Common | `common/meta_data` | Provider-agnostic metadata, tags, and labels helper |
| Common | `common/multi_string_replacer` | Utility placeholder replacement helper |
| AWS | `aws/networking/vpc` | Starter VPC module scaffold |
| AWS | `aws/storage/s3` | Reusable S3 bucket module with secure defaults |
| AWS | `aws/edge/cloudfront` | CloudFront distribution module for S3 private origins |
| Azure | `azure/networking/vnet` | Starter VNet module scaffold |
| GCP | `gcp/networking/vpc` | Starter VPC module scaffold |

These cloud-specific modules are intentionally lightweight scaffolds so the repo can start cleanly and evolve safely.

## Standards

Every module should contain:

- `README.md`
- `versions.tf`
- `main.tf`
- `variables.tf`
- `outputs.tf`
- at least one example under `examples/`

Recommended additions when the module grows:

- `locals.tf`
- `data.tf`
- `providers.tf`
- `tests/`

## Documentation

- Repo structure: [docs/repository-layout.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/docs/repository-layout.md)
- Module authoring guide: [docs/module-authoring.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/docs/module-authoring.md)
- Contribution workflow: [docs/contribution-workflow.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/docs/contribution-workflow.md)
- Security and quality controls: [docs/security-and-quality.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/docs/security-and-quality.md)
- AI tooling guide: [docs/ai-tooling.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/docs/ai-tooling.md)

## Local Commands

```bash
make fmt
make examples-fmt
make lint
make validate
make ai-context
make ai-validate
make security
make docs
```

## GitHub Actions

The repository now includes:

- `Terraform Quality`: `fmt`, `tflint`, and `terraform validate` over examples
- `Security`: `gitleaks` secret scanning and `trivy` IaC misconfiguration scanning
- `Dependabot`: weekly updates for GitHub Actions and Terraform dependencies

These checks are intended to protect module quality and reduce the risk of secrets or unsafe patterns being merged.

## AI Tooling

This repo now includes:

- [SKILL.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/SKILL.md) for Codex-style project context
- [AGENTS.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/AGENTS.md) for broader agentic coding tools
- `.agents/` role files for authoring, security review, and final release checks
- `scripts/harness/` scripts so AI tools can inspect the repo and run validation consistently

## Contributing

See [CONTRIBUTING.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/CONTRIBUTING.md) before opening a PR.
