# Security And Quality

This repository includes repository-level controls to reduce the chance of broken modules or leaked information reaching `main`.

## Quality Controls

- `terraform fmt` enforces consistent formatting
- `tflint` catches common Terraform issues early
- `terraform validate` runs against examples to prove consumer-facing configs still parse correctly

## Security Controls

- `gitleaks` scans the repository history and current changes for secrets
- `trivy config` scans Terraform code for IaC security risks
- `.gitignore` excludes `*.tfvars`, local state, and transient Terraform artifacts

## Author Responsibilities

- use placeholders in all example values
- do not hardcode tenant IDs, access keys, passwords, or certificates
- prefer input variables over embedded credentials
- mark secret-like variables as `sensitive = true`
- avoid outputs that expose confidential values

## Recommended Branch Protection

Enable these repository settings in GitHub:

- require pull request before merging
- require status checks to pass
- require review from code owners
- dismiss stale approvals when new commits are pushed
- restrict direct pushes to `main`

## Recommended Future Enhancements

- add `pre-commit` hooks for local developer enforcement
- add `terraform-docs` generation checks
- add integration tests for mature modules
- add OIDC-based cloud auth for test environments instead of static credentials
