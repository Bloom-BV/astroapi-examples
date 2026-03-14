// Retrograde periods for 2024

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

const response = await fetch(`${BASE_URL}/api/calc/retrograde`, {
    method: "POST",
    headers: {
        "X-Api-Key": API_KEY,
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        startDate: "2024-01-01",
        endDate: "2024-12-31",
        points: ["mercury", "venus", "mars", "jupiter", "saturn"]
    })
});

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const data = await response.json();
console.log(JSON.stringify(data, null, 2));
