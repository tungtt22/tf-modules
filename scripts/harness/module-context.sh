#!/usr/bin/env sh

set -eu

REPO_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
cd "$REPO_ROOT"

echo "Modules:"
find modules -mindepth 3 -maxdepth 3 -type d | sort

echo
echo "Examples:"
find examples -mindepth 3 -maxdepth 3 -type d | sort

echo
echo "Documentation:"
find docs -maxdepth 1 -type f | sort
