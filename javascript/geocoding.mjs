// Search for a location

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

const query = "Amsterdam";

const response = await fetch(`${BASE_URL}/api/geocoding/search?q=${encodeURIComponent(query)}&limit=5&lang=en`, {
    headers: {
        "X-Api-Key": API_KEY
    }
});

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const data = await response.json();
console.log(JSON.stringify(data, null, 2));
