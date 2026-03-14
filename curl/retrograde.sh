#!/usr/bin/env bash
# Retrograde periods for 2024
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/calc/retrograde" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "startDate": "2024-01-01",
        "endDate": "2024-12-31",
        "points": ["mercury", "venus", "mars", "jupiter", "saturn"]
    }' | jq .
