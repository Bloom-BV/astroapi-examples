#!/usr/bin/env bash
# Download natal chart as PNG
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s "$BASE_URL/api/chart2/natal.png?width=800&height=800&dateTime=1990-06-15T14:30&location.longitude=4.89&location.latitude=52.37&location.timezone=Europe/Amsterdam" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -o natal-chart.png

echo "Chart saved to natal-chart.png"
