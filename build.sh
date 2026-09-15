#!/usr/bin/env bash
# Reproducible build of the module installation package.
# Usage: bash build.sh   (produces dist/crm.ecommerce-gateway-<version>.zip)
set -euo pipefail
cd "$(dirname "$0")"
VERSION="$(php -r '$m = json_decode((string)file_get_contents("upload/manifest.json"), true); echo $m["version"] ?? "0.0.0";')"
mkdir -p dist
rm -f "dist/crm.ecommerce-gateway-${VERSION}.zip"
(cd upload && zip -r -X "../dist/crm.ecommerce-gateway-${VERSION}.zip" manifest.json api web >/dev/null)
unzip -t "dist/crm.ecommerce-gateway-${VERSION}.zip" >/dev/null
echo "Built dist/crm.ecommerce-gateway-${VERSION}.zip"
