# Repository Layout

This repository follows a monorepo structure so all Terraform modules share the same conventions while staying separated by cloud and domain.

## Top-Level Directories

### `modules/`

The source of truth for reusable modules.

- `modules/common`: provider-agnostic utilities
- `modules/aws`: AWS modules
- `modules/azure`: Azure modules
- `modules/gcp`: GCP modules

### `examples/`

Minimal consumer-facing examples that show how to use each module. Keep examples short, readable, and aligned to real usage patterns.

### `docs/`

Repository-level guidance that should not be duplicated inside every module README.

### `.github/`

Pull request workflow, templates, and CI definitions.

## Why This Shape Works

- It scales cleanly as more clouds and domains are added.
- It avoids mixing provider-specific resources in shared modules.
- It gives consumers one predictable place to find examples.
- It makes contribution review easier because all modules follow the same skeleton.

## Recommended Growth Pattern

When a new infrastructure concern is introduced:

1. Check whether it belongs in `common` or a specific cloud.
2. Group it by domain such as `networking`, `security`, `identity`, `compute`, or `data`.
3. Add an example at the same time as the module.
4. Document assumptions early before the module grows complex.
