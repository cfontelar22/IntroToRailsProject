Geocoder.configure(
  # Geocoding options
  timeout: 3,                 # geocoding service timeout (secs)
  lookup: :nominatim,         # name of geocoding service (symbol)
  # For Nominatim (OpenStreetMap) usage, include HTTP headers to avoid being blocked
  http_headers: { "User-Agent" => "Intro to Rails" },
  # To use an API key for services that require it:
  api_key: 'pk.eyJ1IjoiZm9udGVsYXJjaiIsImEiOiJjbHRya3UxZ3owN3puMnJwaW9zczNuYnZyIn0.lVEyzieDPflukT_oP2FzeA',
)
