// Transit aspects for a date range

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

const response = await fetch(`${BASE_URL}/api/calc/transit`, {
    method: "POST",
    headers: {
        "X-Api-Key": API_KEY,
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        birthDate: "1990-06-15T14:30",
        birthLocation: {
            latitude: 52.37,
            longitude: 4.89,
            timezone: "Europe/Amsterdam"
        },
        transitDateStart: "2024-01-01T00:00",
        transitDateEnd: "2024-01-31T23:59",
        transitLocation: {
            latitude: 52.37,
            longitude: 4.89,
            timezone: "Europe/Amsterdam"
        }
    })
});

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const data = await response.json();
console.log(JSON.stringify(data, null, 2));
