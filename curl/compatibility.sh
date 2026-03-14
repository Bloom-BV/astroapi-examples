#!/usr/bin/env bash
# Love compatibility between two people
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/compatibility" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "dateTime1": "1990-06-15T14:30",
        "location1": {
            "longitude": 4.89,
            "latitude": 52.37,
            "timezone": "Europe/Amsterdam"
        },
        "dateTime2": "1988-03-22T09:15",
        "location2": {
            "longitude": 2.35,
            "latitude": 48.86,
            "timezone": "Europe/Paris"
        },
        "language": "en",
        "includeText": true,
        "includeReadableEntities": true
    }' | jq .
