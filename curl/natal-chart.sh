#!/usr/bin/env bash
# Natal chart with house system selection
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/natal" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "dateTime": "1990-06-15T14:30",
        "location": {
            "latitude": 52.37,
            "longitude": 4.89,
            "timezone": "Europe/Amsterdam"
        },
        "houseSystem": "placidus"
    }' | jq .
