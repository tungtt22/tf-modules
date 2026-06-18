SHELL := /bin/sh

.PHONY: fmt examples-fmt lint validate ai-validate ai-context docs security help

help:
	@echo "Available targets:"
	@echo "  make fmt           - Format all module Terraform files"
	@echo "  make examples-fmt  - Format all example Terraform files"
	@echo "  make lint          - Lint Terraform code with tflint"
	@echo "  make validate      - Init and validate examples"
	@echo "  make ai-validate   - Run the AI-friendly validation harness"
	@echo "  make ai-context    - Print module/example/doc inventory for agents"
	@echo "  make security      - Reminder target for security scanning tools"
	@echo "  make docs          - Reminder target for README/doc maintenance"

fmt:
	terraform fmt -recursive modules

examples-fmt:
	terraform fmt -recursive examples

lint:
	find modules -type f -name main.tf -exec dirname {} \; | sort -u | while read -r dir; do \
		tflint --chdir="$$dir"; \
	done
	find examples -type f -name main.tf -exec dirname {} \; | sort -u | while read -r dir; do \
		tflint --chdir="$$dir"; \
	done

validate:
	find examples -type f -name main.tf -exec dirname {} \; | sort -u | while read -r dir; do \
		terraform -chdir="$$dir" init -backend=false -input=false; \
		terraform -chdir="$$dir" validate; \
	done

ai-validate:
	./scripts/harness/validate.sh

ai-context:
	./scripts/harness/module-context.sh

docs:
	@echo "Update module README files and examples when interfaces change."

security:
	@echo "Run gitleaks and trivy in CI, and keep examples free of real secrets."
