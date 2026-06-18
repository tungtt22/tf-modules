# AGENTS

This repository is a multi-cloud Terraform modules monorepo. AI tools should treat the repo as a reusable module library, not as a single deployable stack.

## Read First

1. `README.md`
2. `SKILL.md`
3. `CONTRIBUTING.md`
4. `SECURITY.md`
5. `docs/module-authoring.md`
6. `docs/security-and-quality.md`

## Repository Intent

- `modules/` contains reusable source modules.
- `examples/` shows how consumers should use those modules.
- `docs/` defines contribution, authoring, and security expectations.
- `.github/workflows/` defines the CI and security gates that changes should satisfy.

## Non-Negotiable Rules

- Never commit real credentials, tokens, keys, certificates, kubeconfigs, or populated `*.tfvars`.
- Keep provider-specific logic in the matching cloud subtree.
- Update examples and docs when module interfaces change.
- Prefer additive, backward-compatible changes unless explicitly asked to make a breaking change.
- Avoid outputs that reveal secret material.

## Preferred Validation Path

Run from repo root:

```bash
./scripts/harness/validate.sh
```

If you only need a quick inventory of modules and examples:

```bash
./scripts/harness/module-context.sh
```

## Review Priorities

1. Security and secret safety
2. Module contract correctness
3. Example correctness
4. Documentation completeness
5. Formatting and lint cleanliness
