#!/usr/bin/env bash
# Solar return chart for 2024
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/solar-return" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "birthDateTime": "1990-06-15T14:30",
        "birthLocation": {
            "longitude": 4.89,
            "latitude": 52.37,
            "timezone": "Europe/Amsterdam"
        },
        "returnYear": 2024,
        "houseSystem": "placidus",
        "language": "en",
        "includeText": true,
        "includeReadableEntities": true
    }' | jq .
