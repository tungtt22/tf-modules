# AI Tooling

This repository includes a small AI harness so coding agents can understand the repo and validate common Terraform changes consistently.

## Entry Points

- [SKILL.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/SKILL.md): Codex-style project skill with repo context and working rules
- [AGENTS.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/AGENTS.md): cross-tool operating guide for agentic coding tools
- [.agents/tf-modules-author-agent.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/.agents/tf-modules-author-agent.md): implementation lens
- [.agents/tf-modules-security-reviewer.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/.agents/tf-modules-security-reviewer.md): security review lens
- [.agents/tf-modules-release-checker.md](/Users/tungtt22/Workspace/tungtt22/tf-modules/.agents/tf-modules-release-checker.md): handoff and release lens

## Harness Scripts

- [scripts/harness/validate.sh](/Users/tungtt22/Workspace/tungtt22/tf-modules/scripts/harness/validate.sh): runs formatting, optional linting, and example validation
- [scripts/harness/module-context.sh](/Users/tungtt22/Workspace/tungtt22/tf-modules/scripts/harness/module-context.sh): prints a quick map of modules, examples, and docs

## Recommended Usage

1. Read `README.md`, `SKILL.md`, `CONTRIBUTING.md`, and `SECURITY.md`.
2. Inspect the target module and the nearest example together.
3. Make the change.
4. Run `./scripts/harness/validate.sh`.
5. Report any skipped checks, especially when local tooling is missing.

## Why This Exists

The goal is to give AI tools enough project-specific context to make good Terraform changes without embedding excessive process into each prompt.
