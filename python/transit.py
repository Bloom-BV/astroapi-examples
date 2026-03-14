# AstroAPI — Transit aspects for a date range

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
}

response = requests.post(f"{BASE_URL}/api/calc/transit", headers=HEADERS, json=payload)
response.raise_for_status()

data = response.json()
print(json.dumps(data, indent=2))
