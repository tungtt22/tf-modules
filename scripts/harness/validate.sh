#!/usr/bin/env sh

set -eu

REPO_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
cd "$REPO_ROOT"

echo "==> terraform fmt -check"
terraform fmt -check -recursive modules examples

if command -v tflint >/dev/null 2>&1; then
  echo "==> tflint"
  find modules -type f -name main.tf -exec dirname {} \; | sort -u | while read -r dir; do
    echo "Linting $dir"
    tflint --chdir="$dir"
  done

  find examples -type f -name main.tf -exec dirname {} \; | sort -u | while read -r dir; do
    echo "Linting $dir"
    tflint --chdir="$dir"
  done
else
  echo "==> skipping tflint: command not found"
fi

echo "==> terraform init/validate examples"
find examples -type f -name main.tf -exec dirname {} \; | sort -u | while read -r dir; do
  echo "Validating $dir"
  terraform -chdir="$dir" init -backend=false -input=false
  terraform -chdir="$dir" validate
done

echo "==> harness validation completed"
