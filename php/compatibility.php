<?php
// AstroAPI — Love compatibility between two persons

$apiKey = getenv("ASTROAPI_KEY");
$baseUrl = getenv("ASTROAPI_BASE_URL") ?: "https://api.astroapi.cloud";

if (!$apiKey) {
    fwrite(STDERR, "Error: Set ASTROAPI_KEY environment variable first.\n");
    fwrite(STDERR, "  export ASTROAPI_KEY=\"your-api-key\"\n");
    exit(1);
}

function postRequest(string $url, array $data, string $apiKey): string {
    $ch = curl_init($url);
    curl_setopt_array($ch, [
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => json_encode($data),
        CURLOPT_HTTPHEADER => [
            "X-Api-Key: $apiKey",
            "Content-Type: application/json"
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

$response = postRequest("$baseUrl/api/calc/compatibility", [
    "person1" => [
        "dateTime" => "1990-06-15T14:30",
        "latitude" => 52.37,
        "longitude" => 4.89,
        "timezone" => "Europe/Amsterdam"
    ],
    "person2" => [
        "dateTime" => "1988-03-22T09:15",
        "latitude" => 48.86,
        "longitude" => 2.35,
        "timezone" => "Europe/Paris"
    ],
    "includeText" => true,
    "includeReadableEntities" => true
], $apiKey);

echo json_encode(json_decode($response), JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE) . "\n";
