# Contribution Workflow

## Standard Flow

1. Create or update a module.
2. Add or update examples.
3. Update module README and any relevant repo docs.
4. Run formatting, linting, and validation locally.
5. Open a pull request with clear change notes.

## PR Description Template Guidance

Make sure your PR explains:

- the problem being solved
- the module path affected
- whether this is breaking or non-breaking
- what examples or docs changed
- whether any security-sensitive behavior changed

## Breaking Changes

Call out breaking changes early in the PR title and description. Examples include:

- removing an input
- renaming an output
- changing the meaning of an existing variable

## Suggested Domain Taxonomy

Use these domains unless there is a strong reason not to:

- `networking`
- `security`
- `identity`
- `compute`
- `data`
- `observability`

This keeps modules easy to browse across clouds.

## Required Checks

Pull requests should pass:

- Terraform formatting
- TFLint
- Terraform validate on examples
- Gitleaks secret scanning
- Trivy IaC scanning
