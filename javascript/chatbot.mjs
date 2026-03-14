// AI astrology chatbot — send a message with birth data

const API_KEY = process.env.ASTROAPI_KEY;
const BASE_URL = process.env.ASTROAPI_BASE_URL || "https://api.astroapi.cloud";
const CHATBOT_ID = process.env.CHATBOT_ID;

if (!API_KEY) {
    console.error("Error: Set ASTROAPI_KEY environment variable first.");
    process.exit(1);
}

if (!CHATBOT_ID) {
    console.error("Error: Set CHATBOT_ID environment variable.");
    console.error("  Create a chatbot first via the AstroAPI dashboard.");
    process.exit(1);
}

const response = await fetch(`${BASE_URL}/api/chat/${CHATBOT_ID}/direct`, {
    method: "POST",
    headers: {
        "X-Api-Key": API_KEY,
        "Content-Type": "application/json"
    },
    body: JSON.stringify({
        message: "What does my Sun sign say about my personality?",
        birthData: {
            date: "1990-06-15",
            time: "14:30",
            latitude: 52.37,
            longitude: 4.89,
            placeName: "Amsterdam, Netherlands",
            timezone: "Europe/Amsterdam"
        }
    })
});

if (!response.ok) {
    console.error(`Error: ${response.status} ${response.statusText}`);
    console.error(await response.text());
    process.exit(1);
}

const text = await response.text();
console.log(text);
