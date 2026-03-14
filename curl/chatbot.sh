#!/usr/bin/env bash
# AI astrology chatbot — send a message with birth data
set -euo pipefail

if [ -z "${ASTROAPI_KEY:-}" ]; then
    echo "Error: Set ASTROAPI_KEY environment variable first." >&2
    echo "  export ASTROAPI_KEY=\"your-api-key\"" >&2
    exit 1
fi

if [ -z "${CHATBOT_ID:-}" ]; then
    echo "Error: Set CHATBOT_ID environment variable." >&2
    echo "  Create a chatbot first via the AstroAPI dashboard." >&2
    exit 1
fi

BASE_URL="${ASTROAPI_BASE_URL:-https://api.astroapi.cloud}"

curl -s -X POST "$BASE_URL/api/chat/$CHATBOT_ID/direct" \
    -H "X-Api-Key: $ASTROAPI_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "message": "What does my Sun sign say about my personality?",
        "birthData": {
            "date": "1990-06-15",
            "time": "14:30",
            "latitude": 52.37,
            "longitude": 4.89,
            "placeName": "Amsterdam, Netherlands",
            "timezone": "Europe/Amsterdam"
        }
    }'
