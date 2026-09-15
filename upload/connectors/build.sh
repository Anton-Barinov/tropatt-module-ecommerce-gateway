#!/usr/bin/env bash
# Build every connector distribution archive from this directory.
# Usage: bash build.sh   (produces connectors/dist/*.zip)
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p dist

echo "Building tropatt-opencart-2.3 ..."
rm -f dist/tropatt-opencart-2.3.ocmod.zip
(cd opencart-2.3 && zip -r -X "../dist/tropatt-opencart-2.3.ocmod.zip" upload install.xml README.md LICENSE >/dev/null)

echo "Building tropatt-opencart-3.0 ..."
rm -f dist/tropatt-opencart-3.ocmod.zip
(cd opencart-3.0 && zip -r -X "../dist/tropatt-opencart-3.ocmod.zip" upload install.json README.md >/dev/null)

echo "Building tropatt-opencart-4.0 ..."
rm -f dist/tropatt-opencart-4.ocmod.zip
(cd opencart-4.0 && zip -r -X "../dist/tropatt-opencart-4.ocmod.zip" extension README.md >/dev/null)

echo "Building tropatt-woocommerce ..."
rm -f dist/tropatt-woocommerce.zip
rm -rf .build && mkdir -p .build/tropatt-ecommerce
cp -R woocommerce/tropatt-ecommerce.php woocommerce/includes .build/tropatt-ecommerce/
(cd .build && zip -r -X "../dist/tropatt-woocommerce.zip" tropatt-ecommerce >/dev/null)
rm -rf .build

for z in dist/*.zip; do unzip -t "$z" >/dev/null; echo "  OK $z"; done
echo "All connector packages built."
