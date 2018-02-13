


/* 
ref 

-- https://gis.stackexchange.com/questions/256752/st-makepointlong-lat-hint-no-function-matches-the-given-name-and-argument-ty
-- https://postgis.net/docs/ST_MakePoint.html

SELECT ST_MakePoint(-71.1043443253471, 42.3150676015829);
SELECT ST_SetSRID(ST_MakePoint(-71.1043443253471, 42.3150676015829),4326);
*/ 


-- create the table 
-- dev 



-- transform lat, lat type before run query below 
ALTER TABLE rw.user_address_dev
ALTER COLUMN lat TYPE double precision USING lat::double precision;


ALTER TABLE rw.user_address_dev
ALTER COLUMN lon TYPE double precision USING lon::double precision;



--  SQL
WITH user_address_geom AS
  (SELECT ST_SetSRID(ST_MakePoint(lon, lat),4326) AS start_pos_gis
   FROM rw.user_address_dev)
SELECT u.*,
       sz.name AS start_zone_name
FROM user_address_geom u
LEFT JOIN rw.zone_table_dev sz ON st_contains(sz.geom, u.start_pos_gis)





