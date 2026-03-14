#!/usr/bin/env bash
# Weekly horoscope for Aries
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

YEAR=$(date +%Y)
WEEK=$(date +%V)

curl -s "$BASE_URL/api/horoscope/weekly/$YEAR/$WEEK/aries?language=en" \
    -H "X-Api-Key: $ASTROAPI_KEY" | jq .
