#!/usr/bin/env bash
# Simple setup script to verify a Swift toolchain is available.
set -euo pipefail

if ! command -v swift >/dev/null; then
  echo "Swift toolchain not found. Install from https://swift.org." >&2
  exit 1
fi

swift --version
