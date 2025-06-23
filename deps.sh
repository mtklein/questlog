#!/usr/bin/env bash
# Installs Flutter for CI or local development.
set -euo pipefail
FLUTTER_VERSION="3.22.0"
DEST="$HOME/flutter"
if [ ! -d "$DEST" ]; then
  mkdir -p "$DEST"
  curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" | tar xJ -C "$HOME"
fi
export PATH="$DEST/bin:$PATH"
flutter --version
