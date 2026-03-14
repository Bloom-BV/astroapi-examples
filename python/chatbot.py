# AstroAPI — AI chatbot conversation

import os
import sys

import requests

API_KEY = os.environ.get("ASTROAPI_KEY")
BASE_URL = os.environ.get("ASTROAPI_BASE_URL", "https://api.astroapi.cloud")
CHATBOT_ID = os.environ.get("CHATBOT_ID")

if not API_KEY:
    print("Error: Set ASTROAPI_KEY environment variable first.", file=sys.stderr)
    print('  export ASTROAPI_KEY="your-api-key"', file=sys.stderr)
    sys.exit(1)

if not CHATBOT_ID:
    print("Error: Set CHATBOT_ID environment variable first.", file=sys.stderr)
    print('  export CHATBOT_ID="your-chatbot-id"', file=sys.stderr)
    sys.exit(1)

HEADERS = {
    "X-Api-Key": API_KEY,
    "Content-Type": "application/json"
}

payload = {
    "message": "What does it mean to have Sun in Gemini and Moon in Scorpio?",
    "birthData": {
        "date": "1990-06-15",
        "time": "14:30",
        "latitude": 52.37,
        "longitude": 4.89,
        "placeName": "Amsterdam, Netherlands",
        "timezone": "Europe/Amsterdam"
    }
}

response = requests.post(
    f"{BASE_URL}/api/chat/{CHATBOT_ID}/direct",
    headers=HEADERS,
    json=payload,
    stream=True
)

if response.status_code != 200:
    print(f"Error: {response.status_code} — {response.text}", file=sys.stderr)
    sys.exit(1)

# The chatbot returns a streaming SSE response
for line in response.iter_lines(decode_unicode=True):
    if line:
        print(line)
