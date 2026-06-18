# Security Policy

## Supported Scope

This repository contains reusable Terraform modules and examples. Security expectations apply to:

- Terraform module source under `modules/`
- examples under `examples/`
- GitHub Actions workflows under `.github/workflows/`
- repository documentation when it includes operational guidance

## Reporting

Do not open a public issue for suspected leaked credentials, sensitive values, or exploitable infrastructure misconfigurations.

Instead:

1. Revoke any exposed credential immediately if possible.
2. Remove or rotate the secret in the source system.
3. Contact the repository maintainers through a private channel.
4. Include the commit, file path, and impact summary.

## Secure Contribution Rules

- Never commit real credentials, tokens, certificates, kubeconfigs, or private keys.
- Never commit populated `*.tfvars` files.
- Use placeholders in examples.
- Mark sensitive Terraform inputs with `sensitive = true` when appropriate.
- Prefer least-privilege defaults in module design.
- Treat remote state, provider auth, and secret injection as caller responsibilities unless the module clearly documents otherwise.

## Automated Controls

This repository uses GitHub Actions to:

- run formatting and linting checks
- validate examples
- scan for leaked secrets
- scan Terraform for security misconfigurations

These checks reduce risk, but they do not replace careful review.
