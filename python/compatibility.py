# AstroAPI — Love compatibility between two people

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
    "includeText": True,
    "includeReadableEntities": True
}

response = requests.post(f"{BASE_URL}/api/calc/compatibility", headers=HEADERS, json=payload)
response.raise_for_status()

data = response.json()
print(json.dumps(data, indent=2))
