// Combo: Search for a city, then calculate a natal chart using the coordinates

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

// Step 1: Geocode the birth city
const city = "Amsterdam";
console.log(`Step 1: Searching for "${city}"...`);

const geoResponse = await fetch(
    `${BASE_URL}/api/geocoding/search?q=${encodeURIComponent(city)}&limit=1&lang=en`,
    { headers: { "X-Api-Key": API_KEY } }
);

if (!geoResponse.ok) {
    console.error(`Geocoding error: ${geoResponse.status}`);
    console.error(await geoResponse.text());
    process.exit(1);
}

const geoData = await geoResponse.json();
const location = geoData.data[0];
console.log(`Found: ${location.displayName} (${location.latitude}, ${location.longitude})\n`);

// Step 2: Calculate natal chart using the coordinates
console.log("Step 2: Calculating natal chart...");

const natalResponse = await fetch(`${BASE_URL}/api/calc/natal`, {
    method: "POST",
    headers: {
        "X-Api-Key": API_KEY,
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        dateTime: "1990-06-15T14:30",
        location: {
            latitude: location.latitude,
            longitude: location.longitude,
            timezone: "Europe/Amsterdam"
        }
    })
});

if (!natalResponse.ok) {
    console.error(`Natal chart error: ${natalResponse.status}`);
    console.error(await natalResponse.text());
    process.exit(1);
}

const natalData = await natalResponse.json();
console.log(JSON.stringify(natalData, null, 2));
