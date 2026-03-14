<?php
// AstroAPI — Fetch today's daily horoscope

$apiKey = getenv("ASTROAPI_KEY");
$baseUrl = getenv("ASTROAPI_BASE_URL") ?: "https://api.astroapi.cloud";

if (!$apiKey) {
    fwrite(STDERR, "Error: Set ASTROAPI_KEY environment variable first.\n");
    fwrite(STDERR, "  export ASTROAPI_KEY=\"your-api-key\"\n");
    exit(1);
}

function getRequest(string $url, string $apiKey): string {
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_HTTPHEADER => [
            "X-Api-Key: $apiKey"
        ]
    ]);
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        fwrite(STDERR, "Error: HTTP $httpCode\n$response\n");
        exit(1);
    }

    return $response;
}

$today = date("Y-m-d");
$response = getRequest("$baseUrl/api/horoscope/daily/$today?language=en", $apiKey);

echo json_encode(json_decode($response), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
