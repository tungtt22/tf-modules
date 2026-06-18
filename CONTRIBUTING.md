# Contributing

This repository is designed to stay easy to understand as the number of modules grows. Follow these rules so new modules feel consistent with the existing ones.

## Principles

- Keep shared logic in `modules/common` whenever it is provider-agnostic.
- Keep cloud modules focused on one concern at a time.
- Prefer small, composable modules over large opinionated bundles.
- Add or update examples whenever module inputs or behavior change.
- Document inputs, outputs, assumptions, and limitations in the module README.
- Never use real secrets or environment-specific credentials in examples.

## Adding a New Module

1. Create the module under `modules/<cloud-or-common>/<domain>/<name>`.
2. Add these files:
   - `README.md`
   - `versions.tf`
   - `main.tf`
   - `variables.tf`
   - `outputs.tf`
3. Add at least one example under `examples/<cloud>/<domain>/<example-name>`.
4. Update the root `README.md` if the module should be discoverable from the top-level catalog.
5. Run formatting and validation before opening a pull request.

## Recommended File Structure

```text
modules/aws/networking/vpc/
├── README.md
├── main.tf
├── outputs.tf
├── variables.tf
└── versions.tf
```

## Pull Request Expectations

- One logical change per PR when possible.
- Include example updates for behavior changes.
- Explain why the change is needed and what module consumers should know.
- Call out breaking changes explicitly.
- Ensure GitHub Actions checks stay green.

## Versioning Guidance

- Treat module interface changes carefully.
- If you rename or remove inputs/outputs, document it as a breaking change.
- If you add optional inputs with safe defaults, it is usually non-breaking.

## Style Guidance

- Use descriptive variable names.
- Keep defaults conservative.
- Add validation to important inputs.
- Prefer explicit outputs over requiring consumers to inspect internals.
- Avoid embedding environment-specific values into modules.
- Mark secret-like variables as `sensitive = true`.
- Avoid outputs that expose confidential values.

## Review Checklist

- Does the module path match the cloud/domain naming convention?
- Is the README enough for a new user to adopt the module?
- Is there an example showing intended usage?
- Are variables typed and documented?
- Are outputs useful to downstream stacks?
- Are example values clearly fake and safe to publish?
- Would this change pass lint, validate, and security scans?

## Local Workflow

```bash
make fmt
make examples-fmt
make lint
make validate
make ai-context
make ai-validate
```

Read [SECURITY.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/SECURITY.md) before contributing changes that touch authentication, secrets, state handling, or provider configuration.

If you are using an AI coding tool, start with [SKILL.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/SKILL.md), [AGENTS.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/AGENTS.md), and [docs/ai-tooling.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/docs/ai-tooling.md).
