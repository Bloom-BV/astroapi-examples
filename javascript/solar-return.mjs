// Solar return chart for 2024

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

const response = await fetch(`${BASE_URL}/api/calc/solar-return`, {
    method: "POST",
    headers: {
        "X-Api-Key": API_KEY,
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        birthDateTime: "1990-06-15T14:30",
        birthLocation: {
            longitude: 4.89,
            latitude: 52.37,
            timezone: "Europe/Amsterdam"
        },
        returnYear: 2024,
        houseSystem: "placidus",
        language: "en",
        includeText: true,
        includeReadableEntities: true
    })
});

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const data = await response.json();
console.log(JSON.stringify(data, null, 2));
