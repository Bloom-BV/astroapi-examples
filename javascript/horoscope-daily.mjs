// Daily horoscope for all zodiac signs

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

const today = new Date().toISOString().split("T")[0];

const response = await fetch(`${BASE_URL}/api/horoscope/daily/${today}?language=en`, {
    headers: {
        "X-Api-Key": API_KEY
    }
});

if (response.status === 403) {
    console.error("Access denied: This endpoint requires the \"daily-report:read\" module.");
    console.error("Please ensure your API key has access to this module.");
    process.exit(1);
}

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const data = await response.json();
console.log(JSON.stringify(data, null, 2));
