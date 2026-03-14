#!/usr/bin/env bash
# Moon calendar for a month
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/moon-calendar/range" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "startDate": "2024-06-01",
        "endDate": "2024-06-30",
        "location": {
            "latitude": 52.37,
            "longitude": 4.89,
            "timezone": "Europe/Amsterdam"
        },
        "aspects": ["conjunction", "sextile", "square", "trine", "opposition"]
    }' | jq .
