echo "Los Angeles"
curl 'https://ago-item-storage.s3.us-east-1.amazonaws.com/bffc21600e5f408ea6791d1bce7738ae/Assessor_Parcels_Data_-_2006_thru_2021_output.csv?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEIb%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJGMEQCIG3WMG7MyvQMJ25Myv3Tkx9B%2BrH9hDZod9KtLEp4Wm7uAiAYVHqddOKcCC3N%2FaSSYGJLMNz2H3yPb7%2BegxSUwGWOVyrVBAje%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F8BEAAaDDYwNDc1ODEwMjY2NSIMq33PmuRZ808PqHbWKqkE1zUbYFpDl3cqChbuTMYadoG6sOHV%2FcezMCi4pfc0RDVajlgRiWR11qqIFhDVyQ4Jg%2B8H5cRnP9vb%2B8oOX5fuceNmt0O27Z5N%2Bp4qkrC9j6XbSpcR9An52pDkVsi7c58o0gI%2BouHysEITqpmjmB4nm0I4NLMDHHvmi9%2B0qojXLAmvG4WO9BEKIU6IsIkhVT0QdmCWDs2cjKleV8x7QUAw8eBPtW%2FEgYcJw9lYIyIsoEYSPvQsNbpN17QqHPmjVeV95HJUR7MNlhk6zAfcsVTeIRzxseIFcHJZyP82VrzzMzreVHJ2PhjzToFrr%2FAyKrQySTCM6rbpnyPh90y2aGSQ%2Fk2U8hRFJaC3sbF8J6DKEWWG%2FX3AZS4%2FOJQKzQyn7ZEsbJX2vWkZlXJLA6e1n%2BwCMgi6c0m1EnKOMBlCgNsNg8CSc7eCE5GOptxYT34huGF0R32VhAS9hY5ZqklQkNHwXboc3w69eEzrwtIl07kt0ft%2BVW6TCAmFTAVBwr9zwFRIX0otyUqY%2FuGO02oUfUJ4O%2FgKm1u3ute8Ad%2BXllH8FmXzfdDEqyUg6907xAXwOr0RR2wilRH6jyVLKaaZq5QdcuAswGdWiRBXybamdPGmPyuLtgrwCV%2F%2FRKQ6fumM8NdYyN4q3zZTQJEeZY98Dl8OhpF7uJNBOHLpEqiKbs2Desjq1CmdTggurfO6w56zRjfKSkhXRswjOP%2BrXonKlyJsPFsgN0%2B6uQ7SxzCIkIeeBjqqAasVcrCMLCbRW%2BFFgCLgbcMHjqy%2Flgs3MOLhvzLY7ef%2FoMhML1XW9dV3NNbX7SO3Efd7jicqFbeZ74bR3H2XjFQfkBvES0Na0vtQTIGAwKzF2JTONC3HZ90tPVijTUCHNB3DdNE9UVnTIEyivvNEOT4P362bVEoqVYJK7xS1uOGLsQYvUJ39Z%2FFbEDPxP49KcayqeCuo0twIi%2FVh8tsZ1KRn%2FaRh8JIfaDlH&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230113T223200Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIAYZTTEKKE2T3DYQ5W%2F20230113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=a2d6e5898a855a654e2a332e2beaddcc2045851fefc444a03ba84e93ee9aab2c' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed --output LosAngeles.csv

echo "Alameda County"
curl 'https://opendata.arcgis.com/api/v3/datasets/b55c25ae04fc47fc9c188dbbfcd51192_0/downloads/data?format=shp&spatialRefId=4326&where=1%3D1' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Referer: https://data.acgov.org/' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed \
  --output Alameda.zip


echo "San Francisco County"
curl https://data.sfgov.org/api/geospatial/wv5m-vpq2\?method\=export\&format\=GeoJSON --output sanfrancisco.geojson

echo "Orange County"
curl https://ocgov.box.com/shared/static/ikqn48rwkpb89gvi04ur4bnbw4k6ibo2.zip --output orangecounty.zip

echo "San Mateo"
curl 'https://data.smcgov.org/api/geospatial/nb88-e3ki?accessType=DOWNLOAD&method=export&format=Shapefile' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: _frontend_session=TUdLMHVRUnA0bzB4eC8zREJocUFBZGRySzNwK3l5aVdsZUtNdmNIUmRYNEdxVnB3WGNQZUhJam1wN2tsUkx5SE9tSTg5R0k1YnkwUVBBM09OZVdxbHhWcW9GcVhtN3BjUlFOdzk1VDJnaGNEaVUyZTh3aFFWdmQxVzlLT3NnQU8yeEttRjZYdFJwSTdhUmQvRnBPUUx1Nk81UmNRRHJEOFptMlFtQU5jY3VlbmVkcVRXZk5HV2ZRamdKVGgzaVZOWVJOU0c4ZkpLUTJDM2VEZFVsOXBkUDI3VnJnU0NVTnBNUUFnaTJ4ZncxT0JXVnVMSzMwSlhxMm5iUGVSMmE4cnNMUDZIempDeGZ4TWp6NXlYR0xrNU51N3VZZ00rclZWSnFvOC9JdWgrb3M9LS1QaEE1bkFvaTUvNTBMRUF5RURIa3JBPT0%3D--497653682e5dd305e7fb32c2a497e6086410e9de; socrata-csrf-token=yOPOUxW0Znv/ZvXq4x1sH7mZwZ+hshxtnN585dVPJd1GtOU1OSu97uc/tFwR4BimyJxgzniNwHe9baw0S/m+qA==' \
  -H 'Referer: https://data.smcgov.org/Government/Parcels/nb88-e3ki' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: same-origin' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed --output SanMateo.zip

# echo "San Mateo"
# curl 'https://data.smcgov.org/api/geospatial/nb88-e3ki?accessType=DOWNLOAD&method=export&format=GeoJSON' \
#   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Connection: keep-alive' \
#   -H 'Cookie: _frontend_session=TUdLMHVRUnA0bzB4eC8zREJocUFBZGRySzNwK3l5aVdsZUtNdmNIUmRYNEdxVnB3WGNQZUhJam1wN2tsUkx5SE9tSTg5R0k1YnkwUVBBM09OZVdxbHhWcW9GcVhtN3BjUlFOdzk1VDJnaGNEaVUyZTh3aFFWdmQxVzlLT3NnQU8yeEttRjZYdFJwSTdhUmQvRnBPUUx1Nk81UmNRRHJEOFptMlFtQU5jY3VlbmVkcVRXZk5HV2ZRamdKVGgzaVZOWVJOU0c4ZkpLUTJDM2VEZFVsOXBkUDI3VnJnU0NVTnBNUUFnaTJ4ZncxT0JXVnVMSzMwSlhxMm5iUGVSMmE4cnNMUDZIempDeGZ4TWp6NXlYR0xrNU51N3VZZ00rclZWSnFvOC9JdWgrb3M9LS1QaEE1bkFvaTUvNTBMRUF5RURIa3JBPT0%3D--497653682e5dd305e7fb32c2a497e6086410e9de; socrata-csrf-token=yOPOUxW0Znv/ZvXq4x1sH7mZwZ+hshxtnN585dVPJd1GtOU1OSu97uc/tFwR4BimyJxgzniNwHe9baw0S/m+qA==' \
#   -H 'Referer: https://data.smcgov.org/Government/Parcels/nb88-e3ki' \
#   -H 'Sec-Fetch-Dest: document' \
#   -H 'Sec-Fetch-Mode: navigate' \
#   -H 'Sec-Fetch-Site: same-origin' \
#   -H 'Sec-Fetch-User: ?1' \
#   -H 'Upgrade-Insecure-Requests: 1' \
#   -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   --compressed --output SanMateo.geojson

echo "San Bernardino County"
# 1.66GB
# curl 'https://opendata.arcgis.com/api/v3/datasets/9ca3e6b812d1473fb42eafd412a16139_0/downloads/data?format=shp&spatialRefId=4326&where=1%3D1' \
#   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#   -H 'Accept-Language: en-US,en;q=0.9' \
#   -H 'Connection: keep-alive' \
#   -H 'Cookie: esri_gdpr=oneTrust; mbox=session#b18582a379e749ffbd47fd1ccfa4dd4c#1673030306|PC#b18582a379e749ffbd47fd1ccfa4dd4c.35_0#1736273246; AMCV_ED8D65E655FAC7797F000101%40AdobeOrg=1176715910%7CMCIDTS%7C19364%7CMCMID%7C29654440805650573465504728623144443689%7CMCAID%7CNONE%7CMCOPTOUT-1673035645s%7CNONE%7CvVersion%7C5.4.0; OptanonAlertBoxClosed=2023-01-06T18:07:53.424Z; OptanonConsent=isGpcEnabled=0&datestamp=Thu+Jan+12+2023+10%3A21%3A35+GMT-0800+(Pacific+Standard+Time)&version=6.35.0&isIABGlobal=false&hosts=&consentId=ad7d4096-8aa7-43a7-ba24-1bd0758ad23d&interactionCount=1&landingPath=NotLandingPage&groups=1%3A1%2C2%3A0%2C3%3A0%2C4%3A0&geolocation=US%3BCA&AwaitingReconsent=false' \
#   -H 'Referer: https://open.sbcounty.gov/' \
#   -H 'Sec-Fetch-Dest: document' \
#   -H 'Sec-Fetch-Mode: navigate' \
#   -H 'Sec-Fetch-Site: cross-site' \
#   -H 'Sec-Fetch-User: ?1' \
#   -H 'Upgrade-Insecure-Requests: 1' \
#   -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
#   -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   --compressed \
#   --output SanBernardino.geojson

# 411.6 MB
# SBCo_Parcel_Polygons.shp
curl 'https://opendata.arcgis.com/api/v3/datasets/9ca3e6b812d1473fb42eafd412a16139_0/downloads/data?format=geojson&spatialRefId=4326&where=1%3D1' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'Accept-Language: en-US,en;q=0.9' \
  -H 'Connection: keep-alive' \
  -H 'Cookie: esri_gdpr=oneTrust; mbox=session#b18582a379e749ffbd47fd1ccfa4dd4c#1673030306|PC#b18582a379e749ffbd47fd1ccfa4dd4c.35_0#1736273246; AMCV_ED8D65E655FAC7797F000101%40AdobeOrg=1176715910%7CMCIDTS%7C19364%7CMCMID%7C29654440805650573465504728623144443689%7CMCAID%7CNONE%7CMCOPTOUT-1673035645s%7CNONE%7CvVersion%7C5.4.0; OptanonAlertBoxClosed=2023-01-06T18:07:53.424Z; OptanonConsent=isGpcEnabled=0&datestamp=Thu+Jan+12+2023+10%3A21%3A35+GMT-0800+(Pacific+Standard+Time)&version=6.35.0&isIABGlobal=false&hosts=&consentId=ad7d4096-8aa7-43a7-ba24-1bd0758ad23d&interactionCount=1&landingPath=NotLandingPage&groups=1%3A1%2C2%3A0%2C3%3A0%2C4%3A0&geolocation=US%3BCA&AwaitingReconsent=false' \
  -H 'Referer: https://open.sbcounty.gov/' \
  -H 'Sec-Fetch-Dest: document' \
  -H 'Sec-Fetch-Mode: navigate' \
  -H 'Sec-Fetch-Site: cross-site' \
  -H 'Sec-Fetch-User: ?1' \
  -H 'Upgrade-Insecure-Requests: 1' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Not?A_Brand";v="8", "Chromium";v="108", "Google Chrome";v="108"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed \
  --output SanBernardino.zip
