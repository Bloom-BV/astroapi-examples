# AstroAPI — Your first API call (natal chart)

import json
import os
import sys

import requests

API_KEY = os.environ.get("ASTROAPI_KEY")
BASE_URL = os.environ.get("ASTROAPI_BASE_URL", "https://api.astroapi.cloud")

if not API_KEY:
    print("Error: Set ASTROAPI_KEY environment variable first.", file=sys.stderr)
    print('  export ASTROAPI_KEY="your-api-key"', file=sys.stderr)
    sys.exit(1)

HEADERS = {
    "X-Api-Key": API_KEY,
    "Content-Type": "application/json"
}

payload = {
    "dateTime": "1990-06-15T14:30",
    "location": {
        "latitude": 52.37,
        "longitude": 4.89,
        "timezone": "Europe/Amsterdam"
    }
}

response = requests.post(f"{BASE_URL}/api/calc/natal", headers=HEADERS, json=payload)
response.raise_for_status()

data = response.json()
print(json.dumps(data, indent=2))
