#!/usr/bin/env bash
set -euo pipefail

# Downloads FMA Small from the dataset's official host and extracts it locally.
# Audio files are not committed to GitHub; keep this dataset outside the app bundle.
DEST="${1:-./assets/music/fma_small}"
ARCHIVE="${DEST}/fma_small.zip"
URL="https://os.unil.cloud.switch.ch/fma/fma_small.zip"

mkdir -p "$DEST"
if [[ ! -f "$ARCHIVE" ]]; then
  echo "Downloading FMA Small (~7.2 GiB)..."
  curl -L --fail --retry 3 --output "$ARCHIVE" "$URL"
else
  echo "Archive already exists: $ARCHIVE"
fi

echo "Extracting FMA Small..."
unzip -n "$ARCHIVE" -d "$DEST"
echo "Done. Dataset location: $DEST"
