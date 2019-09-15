
/*

-- output geom data from posgreSQL as .geojson data 
credit 
https://gis.stackexchange.com/questions/221481/postgis-postgresql-output-geojson
http://www.postgresonline.com/journal/archives/267-Creating-GeoJSON-Feature-Collections-with-JSON-and-PostGIS-functions.html


-- sample code 
SELECT json_build_object(
'type', 'FeatureCollection',

'features', json_agg(
    json_build_object(
        'type',       'Feature',
        'id',         gid,
        'geometry',   ST_AsGeoJSON(ST_ForceRHR(st_transform(geom,4326)))::json,
        'properties', jsonb_set(row_to_json(city_parks)::jsonb,'{geom}','0',false)
    )
)
)
FROM city_parks
WHERE ST_Intersects(city_parks.geom,st_transform(ST_GeographyFromText('POLYGON((-117.963690 33.634180,-117.854780 33.634180,-117.854780 33.702970,-117.963690 33.702970,-117.963690 33.634180))')::geometry,2230));




*/

/*
SELECT json_build_object(
'type', 'FeatureCollection',

'features', json_agg(
    json_build_object(
        'type',       'Feature',
        'id',         gid,
        'geometry',   ST_AsGeoJSON(ST_ForceRHR(st_transform(geom,4326)))::json,
        'properties', jsonb_set(row_to_json(ldn_hex_grid)::jsonb,'{geom}','0',false)
    )
)
)
FROM public.ldn_hex_grid

*/


SELECT json_build_object(
'type', 'FeatureCollection',

'features', json_agg(
    json_build_object(
        'type',       'Feature',
        'gid',         id,
        'geometry',   ST_AsGeoJSON(ST_ForceRHR(st_transform(geom,4326)))::json,
        'properties', jsonb_set(row_to_json(cells_ldn_dev)::jsonb,'{geom}','0',false)
    )
)
)
FROM public.cells_ldn_dev





