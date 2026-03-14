#!/usr/bin/env bash
# Synastry — aspects between two charts
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/synastry" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "dateTime1": "1990-06-15T14:30",
        "location1": {
            "latitude": 52.37,
            "longitude": 4.89,
            "timezone": "Europe/Amsterdam"
        },
        "dateTime2": "1988-03-22T09:15",
        "location2": {
            "latitude": 48.86,
            "longitude": 2.35,
            "timezone": "Europe/Paris"
        }
    }' | jq .
