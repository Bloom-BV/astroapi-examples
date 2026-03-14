#!/usr/bin/env bash
# Search for a location
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s "$BASE_URL/api/geocoding/search?q=Amsterdam&limit=5&lang=en" \
    -H "X-Api-Key: $ASTROAPI_KEY" | jq .
