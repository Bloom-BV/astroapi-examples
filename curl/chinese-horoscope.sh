#!/usr/bin/env bash
# Chinese zodiac sign and element
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/chinese-horoscope" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "birthDate": "1990-06-15",
        "language": "en",
        "includeText": true,
        "includeReadableEntities": true
    }' | jq .
