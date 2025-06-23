#!/usr/bin/env bash
# Simple setup script to verify a Swift toolchain is available.
set -euo pipefail

if ! command -v swift >/dev/null; then
  echo "Swift toolchain not found. Install from https://swift.org." >&2
  exit 1
fi

if [[ "$(uname)" != "Darwin" ]]; then
  echo "SwiftUI apps require macOS with Xcode. Running on $(uname)." >&2
else
  if ! command -v xcodebuild >/dev/null; then
    echo "Xcode not found. Install from the Mac App Store." >&2
    exit 1
  fi
  xcodebuild -version | head -n 1
fi

swift --version
