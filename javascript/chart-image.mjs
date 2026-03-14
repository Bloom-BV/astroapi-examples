// Download natal chart as PNG

import { writeFileSync } from "node:fs";

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

const params = new URLSearchParams({
    width: "800",
    height: "800",
    dateTime: "1990-06-15T14:30",
    "location.longitude": "4.89",
    "location.latitude": "52.37",
    "location.timezone": "Europe/Amsterdam"
});

const response = await fetch(`${BASE_URL}/api/chart2/natal.png?${params}`, {
    headers: {
        "X-Api-Key": API_KEY
    }
});

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const buffer = Buffer.from(await response.arrayBuffer());
writeFileSync("natal-chart.png", buffer);
console.log("Chart saved to natal-chart.png");
