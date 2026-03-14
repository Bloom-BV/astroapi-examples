# AstroAPI Examples

Practical, runnable code examples for the [AstroAPI](https://astroapi.cloud) astrology API.

## Quick Start

1. Get your API key at [astroapi.cloud](https://astroapi.cloud)
2. Set your environment variable:
   ```bash
   export ASTROAPI_KEY="your-api-key-here"
   ```
3. Pick your language and run an example:

| Language | Run | Prerequisites |
|----------|-----|--------------|
| [cURL](./curl/) | `bash curl/01-quickstart.sh` | curl, jq |
| [JavaScript](./javascript/) | `node javascript/01-quickstart.mjs` | Node.js 18+ |
| [Python](./python/) | `python python/01_quickstart.py` | Python 3.8+, requests |
| [PHP](./php/) | `php php/01-quickstart.php` | PHP 8.0+ |

## Available Examples

### Core
| Example | cURL | JS | Python | PHP |
|---------|------|-----|--------|-----|
| Quickstart | [✓](./curl/01-quickstart.sh) | [✓](./javascript/01-quickstart.mjs) | [✓](./python/01_quickstart.py) | [✓](./php/01-quickstart.php) |
| Natal Chart | [✓](./curl/natal-chart.sh) | [✓](./javascript/natal-chart.mjs) | [✓](./python/natal_chart.py) | [✓](./php/natal-chart.php) |
| Natal Chart + Text | [✓](./curl/natal-chart-with-text.sh) | [✓](./javascript/natal-chart-with-text.mjs) | [✓](./python/natal_chart_with_text.py) | |
| Compatibility | [✓](./curl/compatibility.sh) | [✓](./javascript/compatibility.mjs) | [✓](./python/compatibility.py) | [✓](./php/compatibility.php) |
| Synastry | [✓](./curl/synastry.sh) | [✓](./javascript/synastry.mjs) | [✓](./python/synastry.py) | |
| Transit | [✓](./curl/transit.sh) | [✓](./javascript/transit.mjs) | [✓](./python/transit.py) | |

### Returns & Progressions
| Example | cURL | JS | Python |
|---------|------|-----|--------|
| Solar Return | [✓](./curl/solar-return.sh) | [✓](./javascript/solar-return.mjs) | [✓](./python/solar_return.py) |
| Lunar Return | [✓](./curl/lunar-return.sh) | | |
| Progressions | [✓](./curl/progressions.sh) | | |

### Horoscopes
| Example | cURL | JS | Python | PHP |
|---------|------|-----|--------|-----|
| Daily Horoscope | [✓](./curl/horoscope-daily.sh) | [✓](./javascript/horoscope-daily.mjs) | [✓](./python/horoscope_daily.py) | [✓](./php/horoscope-daily.php) |
| Weekly Horoscope | [✓](./curl/horoscope-weekly.sh) | | | |

### Moon
| Example | cURL | JS | Python |
|---------|------|-----|--------|
| Moon Calendar | [✓](./curl/moon-calendar.sh) | [✓](./javascript/moon-calendar.mjs) | [✓](./python/moon_calendar.py) |
| Moon & Sun | [✓](./curl/moon-sun.sh) | | |

### Specialty
| Example | cURL | JS | Python | PHP |
|---------|------|-----|--------|-----|
| Retrograde | [✓](./curl/retrograde.sh) | [✓](./javascript/retrograde.mjs) | [✓](./python/retrograde.py) | |
| Chinese Horoscope | [✓](./curl/chinese-horoscope.sh) | [✓](./javascript/chinese-horoscope.mjs) | [✓](./python/chinese_horoscope.py) | |
| Chinese Forecast | [✓](./curl/chinese-forecast.sh) | | | |
| Numerology Profile | [✓](./curl/numerology-profile.sh) | [✓](./javascript/numerology-profile.mjs) | [✓](./python/numerology_profile.py) | [✓](./php/numerology-profile.php) |
| Numerology Compatibility | [✓](./curl/numerology-compatibility.sh) | [✓](./javascript/numerology-compatibility.mjs) | [✓](./python/numerology_compatibility.py) | |

### Charts & Geocoding
| Example | cURL | JS | Python | PHP |
|---------|------|-----|--------|-----|
| Chart (SVG) | [✓](./curl/chart-svg.sh) | | | |
| Chart (PNG) | [✓](./curl/chart-png.sh) | [✓](./javascript/chart-image.mjs) | [✓](./python/chart_image.py) | [✓](./php/chart-image.php) |
| Geocoding | [✓](./curl/geocoding.sh) | [✓](./javascript/geocoding.mjs) | [✓](./python/geocoding.py) | [✓](./php/geocoding.php) |
| Chatbot | [✓](./curl/chatbot.sh) | [✓](./javascript/chatbot.mjs) | [✓](./python/chatbot.py) | |

### Combo Examples
| Example | JS | Python |
|---------|-----|--------|
| Geocoding → Natal | [✓](./javascript/geocoding-then-natal.mjs) | [✓](./python/geocoding_then_natal.py) |

## Sample Data

All examples use the same people for consistency:

- **Person 1**: June 15, 1990, 14:30, Amsterdam (52.37°N, 4.89°E)
- **Person 2**: March 22, 1988, 09:15, Paris (48.86°N, 2.35°E)

## Documentation

Full API documentation: [docs.astroapi.cloud](https://docs.astroapi.cloud)

## License

MIT — see [LICENSE](./LICENSE)
