# AstroAPI — Daily horoscope for today

import json
import os
import sys
from datetime import date

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

today = date.today().isoformat()

response = requests.get(
    f"{BASE_URL}/api/horoscope/daily/{today}",
    headers=HEADERS,
    params={"language": "en"}
)

if response.status_code == 403:
    print("Access denied: the 'daily-report:read' module is required for this endpoint.")
    print("Make sure your API key has this module enabled.")
    sys.exit(0)

response.raise_for_status()

data = response.json()
print(json.dumps(data, indent=2))
