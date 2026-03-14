#!/usr/bin/env bash
# Secondary progressions
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/progressions" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "birthDateTime": "1990-06-15T14:30",
        "birthLocation": {
            "longitude": 4.89,
            "latitude": 52.37,
            "timezone": "Europe/Amsterdam"
        },
        "targetDate": "2024-06-15T12:00",
        "houseSystem": "placidus",
        "includeText": true
    }' | jq .
