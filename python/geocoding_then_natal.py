# AstroAPI — Geocoding followed by natal chart calculation

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

# Step 1: Geocode "Amsterdam"
print("Step 1: Searching for Amsterdam...")

geo_response = requests.get(
    f"{BASE_URL}/api/geocoding/search",
    headers=HEADERS,
    params={"q": "Amsterdam", "limit": 1, "lang": "en"}
)
geo_response.raise_for_status()

geo_data = geo_response.json()
location = geo_data["data"][0]

latitude = location["latitude"]
longitude = location["longitude"]

print(f"Found: {location['displayName']} (lat={latitude}, lon={longitude})")

# Step 2: Calculate natal chart using geocoded coordinates
print("\nStep 2: Calculating natal chart...")

natal_payload = {
    "dateTime": "1990-06-15T14:30",
    "location": {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": "Europe/Amsterdam"
    }
}

natal_response = requests.post(f"{BASE_URL}/api/calc/natal", headers=HEADERS, json=natal_payload)
natal_response.raise_for_status()

natal_data = natal_response.json()
print("\nNatal chart result:")
print(json.dumps(natal_data, indent=2))
