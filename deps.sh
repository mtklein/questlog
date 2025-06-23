#!/usr/bin/env bash
# Installs Flutter for CI or local development.
set -euo pipefail
FLUTTER_VERSION="3.22.0"
DEST="$HOME/flutter"

if [ ! -d "$DEST" ]; then
  OS=$(uname -s | tr '[:upper:]' '[:lower:]')
  mkdir -p "$DEST"
  if [[ $OS == darwin* ]]; then
    ARCHIVE="flutter_macos_${FLUTTER_VERSION}-stable.zip"
    curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/${ARCHIVE}" -o /tmp/flutter.zip
    unzip -q /tmp/flutter.zip -d "$HOME"
    rm /tmp/flutter.zip
  else
    ARCHIVE="flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"
    curl -L "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/${ARCHIVE}" | tar xJ -C "$HOME"
  fi
fi

export PATH="$DEST/bin:$PATH"
flutter --version
