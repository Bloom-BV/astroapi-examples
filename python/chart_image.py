# AstroAPI — Download natal chart as PNG image

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
    "X-Api-Key": API_KEY
}

params = {
    "dateTime": "1990-06-15T14:30",
    "location.latitude": 52.37,
    "location.longitude": 4.89,
    "location.timezone": "Europe/Amsterdam",
    "houseSystem": "placidus",
    "width": 800,
    "height": 800
}

response = requests.get(
    f"{BASE_URL}/api/chart2/natal.png",
    headers=HEADERS,
    params=params
)
response.raise_for_status()

output_file = "natal_chart.png"
with open(output_file, "wb") as f:
    f.write(response.content)

print(f"Chart image saved to {output_file} ({len(response.content)} bytes)")
