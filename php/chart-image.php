<?php
// AstroAPI — Download a natal chart as PNG image

$apiKey = getenv("ASTROAPI_KEY");
$baseUrl = getenv("ASTROAPI_BASE_URL") ?: "https://api.astroapi.cloud";

if (!$apiKey) {
    fwrite(STDERR, "Error: Set ASTROAPI_KEY environment variable first.\n");
    fwrite(STDERR, "  export ASTROAPI_KEY=\"your-api-key\"\n");
    exit(1);
}

$params = http_build_query([
    "width" => 800,
    "height" => 800,
    "dateTime" => "1990-06-15T14:30",
    "location.longitude" => 4.89,
    "location.latitude" => 52.37,
    "location.timezone" => "Europe/Amsterdam"
]);

$url = "$baseUrl/api/chart2/natal.png?$params";
$outputFile = __DIR__ . "/natal-chart.png";

$ch = curl_init($url);
$fp = fopen($outputFile, "wb");

curl_setopt_array($ch, [
    CURLOPT_RETURNTRANSFER => false,
    CURLOPT_FILE => $fp,
    CURLOPT_HTTPHEADER => [
        "X-Api-Key: $apiKey"
    ]
]);

curl_exec($ch);
$httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
curl_close($ch);
fclose($fp);

if ($httpCode !== 200) {
    unlink($outputFile);
    fwrite(STDERR, "Error: HTTP $httpCode\n");
    exit(1);
}

echo "Chart saved to natal-chart.png\n";
