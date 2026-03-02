#!/usr/bin/env bash
set -euo pipefail
if rg -n "(BEGIN RSA|BEGIN OPENSSH|AKIA[0-9A-Z]{16}|ghp_[A-Za-z0-9]{36}|xox[baprs]-|AIza[0-9A-Za-z\-_]{35})" . --glob '!scripts/validate-no-secrets.sh' ; then
  echo "Potential secret-like material found" >&2
  exit 1
fi
echo "No obvious secret patterns found."
