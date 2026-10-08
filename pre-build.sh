#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
if [[ "${BUILDER_OS:-}" == "WINDOWS" ]]; then
  powershell.exe -NoProfile -NonInteractive -Command 'Expand-Archive -LiteralPath DawnrailSource.zip -DestinationPath . -Force'
else
  unzip -q -o DawnrailSource.zip -d .
fi
test -f Assets/Dawnrail/Runtime/DawnrailGame.cs
test -f Packages/manifest.json
echo "DAWNRAIL_SOURCE_READY"
