
-- 1) create the view with non-null lon & lat

CREATE TABLE rw.user_address_nonnull_lonlat AS
  (SELECT *
   FROM rw.user_address_lonlat
   WHERE lat != 'None'
     AND lon != 'None' ) 
   
   
   
-- 2) transform lat, lat type before run query below

ALTER TABLE rw.user_address_nonnull_lonlat
ALTER COLUMN lat TYPE double precision USING lat::double precision;


ALTER TABLE rw.user_address_nonnull_lonlat
ALTER COLUMN lon TYPE double precision USING lon::double precision;

--  3) SQL
WITH user_address_geom AS
  (SELECT ST_SetSRID(ST_MakePoint(lon, lat), 4326) AS address_pos_gis,
          lon,
          lat
   FROM rw.user_address_nonnull_lonlat)
SELECT u.*,
       sz.name AS zone_name
FROM user_address_geom u
LEFT JOIN rw.homezone sz ON st_contains(sz.geom, u.address_pos_gis)
WHERE sz.name != 'launch homezone'