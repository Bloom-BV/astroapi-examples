#!/usr/bin/env bash
# Transit aspects for January 2024
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/transit" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "birthDate": "1990-06-15T14:30",
        "birthLocation": {
            "latitude": 52.37,
            "longitude": 4.89,
            "timezone": "Europe/Amsterdam"
        },
        "transitDateStart": "2024-01-01T00:00",
        "transitDateEnd": "2024-01-31T23:59",
        "transitLocation": {
            "latitude": 52.37,
            "longitude": 4.89,
            "timezone": "Europe/Amsterdam"
        }
    }' | jq .
