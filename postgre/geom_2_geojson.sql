

SELECT ST_AsGeoJSON (geom) AS geojson
FROM public.us_hex_grid
LIMIT 10 ;