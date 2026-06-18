# Module Authoring Guide

Use this guide when creating or updating modules in this repository.

## Design Rules

- One module should solve one reusable problem.
- Inputs should be explicit and typed.
- Defaults should be safe and unsurprising.
- Outputs should expose useful integration values.
- Cloud-specific behavior should stay inside cloud-specific paths.

## Required Files

Each module should include:

- `versions.tf`
- `main.tf`
- `variables.tf`
- `outputs.tf`
- `README.md`

## README Expectations

Each module README should explain:

- what the module does
- when to use it
- required and optional inputs
- outputs
- a usage example
- limitations or non-goals

## Input Design

- Use `validation` for important business rules.
- Use objects when a group of values should evolve together.
- Avoid overly clever abstractions that hide provider behavior.

## Example Design

- Keep examples runnable and minimal.
- Prefer one example per common use case rather than one huge example.
- Examples should demonstrate the happy path first.

## Multi-Cloud Guidance

- Share conventions, not provider internals.
- Reuse naming and metadata patterns through `modules/common`.
- Do not force AWS, Azure, and GCP modules to have identical inputs if the platforms behave differently.

Consistency matters, but correctness matters more.
