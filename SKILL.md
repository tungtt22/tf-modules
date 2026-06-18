---
name: tf-modules
description: Use when working on this Terraform modules monorepo for multi-cloud infrastructure. Includes the repository layout, module authoring rules, security and quality expectations, examples strategy, and the preferred harness commands for validating AI-generated changes before handoff.
---

# Terraform Modules Monorepo

## Purpose

This repository contains reusable Terraform modules for multiple clouds, plus examples, docs, and CI/security guardrails.

Use this skill when:

- adding or changing Terraform modules under `modules/`
- creating or updating examples under `examples/`
- improving docs, contribution workflow, or GitHub Actions
- reviewing Terraform changes for security, quality, and contributor usability

## Source Of Truth

- `README.md`: repo overview and quick-start for humans
- `modules/`: reusable Terraform modules
- `examples/`: consumer-facing usage examples
- `docs/`: repository policy and authoring guidance
- `.github/workflows/`: CI, quality, and security automation
- `Makefile` and `scripts/harness/`: local validation entrypoints for people and AI tools

## Repository Layout

- `modules/common/`: provider-agnostic helpers and shared conventions
- `modules/aws/`: AWS-specific modules grouped by domain
- `modules/azure/`: Azure-specific modules grouped by domain
- `modules/gcp/`: GCP-specific modules grouped by domain
- `examples/<cloud>/<domain>/`: minimal runnable examples per module family

## Working Rules

1. Keep provider-specific implementation inside the matching cloud path.
2. Put shared naming or metadata logic in `modules/common` when possible.
3. Each module should include `README.md`, `versions.tf`, `main.tf`, `variables.tf`, and `outputs.tf`.
4. Each meaningful module change should come with an example update when behavior or interface changes.
5. Do not put real credentials, tenant IDs, access keys, or populated `*.tfvars` into the repository.
6. Mark secret-like variables as `sensitive = true` and avoid outputs that expose confidential values.
7. Prefer minimal, composable modules over large opinionated bundles.

## Authoring And Review Focus

- Verify that module path naming follows `modules/<cloud-or-common>/<domain>/<module-name>`.
- Keep examples short and obviously safe to publish.
- Prefer typed variables with validation where useful.
- Preserve contributor-facing documentation when changing interfaces.
- If a module contract changes, update the local module README and any relevant repo docs in the same pass.

## Harness

Prefer these commands from the repo root:

- `make fmt`
- `make lint`
- `make validate`
- `./scripts/harness/validate.sh`
- `./scripts/harness/module-context.sh`

If `tflint` is unavailable locally, the harness should report a skip instead of failing silently.

## AI Handoff Files

Use these files when handing the repo to another agent or AI tool:

- `SKILL.md`: machine-readable project context for Codex-style skills
- `AGENTS.md`: cross-tool operating instructions for agentic coding tools
- `.agents/tf-modules-author-agent.md`: authoring and change strategy
- `.agents/tf-modules-security-reviewer.md`: security and policy review lens
- `.agents/tf-modules-release-checker.md`: final validation and handoff checklist
- `docs/ai-tooling.md`: human-readable map of the AI harness
