#!/usr/bin/env bash
# Daily horoscope for all zodiac signs
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

# Use today's date (adjust as needed)
DATE=$(date +%Y-%m-%d)

curl -s "$BASE_URL/api/horoscope/daily/$DATE?language=en" \
    -H "X-Api-Key: $ASTROAPI_KEY" | jq .
