#!/usr/bin/env sh
set -eu

# Installs the latest Nullclaw ARM64 binary for iSH/iPhone environments.
# Usage: sh scripts/install_nullclaw.sh

API_URL="https://api.github.com/repos/nullclaw/nullclaw/releases/latest"
FALLBACK_URL="https://github.com/nullclaw/nullclaw/releases/latest/download/nullclaw-linux-arm64"
TMP_FILE="nullclaw"
DEST="/usr/local/bin/nullclaw"

if ! command -v curl >/dev/null 2>&1; then
  echo "curl not found; installing with apk..."
  apk add --no-cache curl
fi

DOWNLOAD_URL="$({ curl -s "$API_URL" | grep browser_download_url | grep -m1 'nullclaw-linux-arm64' | cut -d '"' -f 4; } || true)"
if [ -z "$DOWNLOAD_URL" ]; then
  DOWNLOAD_URL="$FALLBACK_URL"
fi

echo "Downloading: $DOWNLOAD_URL"
curl -fL "$DOWNLOAD_URL" -o "$TMP_FILE"
chmod +x "$TMP_FILE"
mkdir -p "$(dirname "$DEST")"
mv "$TMP_FILE" "$DEST"

echo "Installed Nullclaw to $DEST"
echo "Run: nullclaw --help"
