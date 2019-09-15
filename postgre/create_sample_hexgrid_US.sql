/*

-- credit
* hex-grid-function
-- https://github.com/yennanliu/postgis-scripts/blob/master/hex-grid/create-hex-grid-function.sql
* sample-hex-grid-usage-us
-- https://github.com/yennanliu/postgis-scripts/blob/master/hex-grid/sample-hex-grid-usage-us.sql

please run the create hex_grid function and hexgrid code together 

*/

CREATE OR REPLACE FUNCTION hex_grid(areakm2 FLOAT, xmin FLOAT, ymin FLOAT, xmax FLOAT, ymax FLOAT, inputsrid INTEGER, workingsrid INTEGER, ouputsrid INTEGER) RETURNS
SETOF geometry AS $BODY$

DECLARE
  minpnt GEOMETRY;
  maxpnt GEOMETRY;
  x1 INTEGER;
  y1 INTEGER;
  x2 INTEGER;
  y2 INTEGER;
  aream2 FLOAT;
  qtrwidthfloat FLOAT;
  qtrwidth INTEGER;
  halfheight INTEGER;

BEGIN

  -- Convert input coords to points in the working SRID
  minpnt = ST_Transform(ST_SetSRID(ST_MakePoint(xmin, ymin), inputsrid), workingsrid);
  maxpnt = ST_Transform(ST_SetSRID(ST_MakePoint(xmax, ymax), inputsrid), workingsrid);

  -- Get grid extents in working SRID coords
  x1 = ST_X(minpnt)::INTEGER;
  y1 = ST_Y(minpnt)::INTEGER;
  x2 = ST_X(maxpnt)::INTEGER;
  y2 = ST_Y(maxpnt)::INTEGER;

  -- Get height and width of hexagon - FLOOR and CEILING are used to get the hexagon size closer to the requested input area
  aream2 := areakm2 * 1000000.0;
  qtrwidthfloat := sqrt(aream2/(sqrt(3.0) * (3.0/2.0))) / 2.0;

  qtrwidth := FLOOR(qtrwidthfloat);
  halfheight := CEILING(qtrwidthfloat * sqrt(3.0));

  -- Return the hexagons - done in pairs, with one offset from the other
  RETURN QUERY (
    SELECT ST_Transform(ST_SetSRID(ST_Translate(geom, x_series::FLOAT, y_series::FLOAT), workingsrid), ouputsrid) AS geom
      FROM generate_series(x1, x2, (qtrwidth * 6)) AS x_series,
           generate_series(y1, y2, (halfheight * 2)) AS y_series,
           (
             SELECT ST_GeomFromText(
               format('POLYGON((0 0, %s %s, %s %s, %s %s, %s %s, %s %s, 0 0))',
                 qtrwidth, halfheight,
                 qtrwidth * 3, halfheight,
                 qtrwidth * 4, 0,
                 qtrwidth * 3, halfheight * -1,
                 qtrwidth, halfheight * -1
               )
             ) AS geom
             UNION
             SELECT ST_Translate(
               ST_GeomFromText(
                 format('POLYGON((0 0, %s %s, %s %s, %s %s, %s %s, %s %s, 0 0))',
                   qtrwidth, halfheight,
                   qtrwidth * 3, halfheight,
                   qtrwidth * 4, 0,
                   qtrwidth * 3, halfheight * -1,
                   qtrwidth, halfheight * -1
                 )
               )
             , qtrwidth * 3, halfheight) as geom
           ) AS two_hex);

END$BODY$ LANGUAGE PLPGSQL VOLATILE COST 100;

--Create table for results

DROP TABLE IF EXISTS us_hex_grid;


CREATE TABLE us_hex_grid ( gid SERIAL NOT NULL PRIMARY KEY,
                                                       geom GEOMETRY('POLYGON', 4326, 2) NOT NULL) WITH (OIDS=FALSE);

-- Create 1km2 hex grid (note: extents allow for the effects of the working projection used)
-- Input parameters: hex_grid(areakm2 float, xmin float, ymin float, xmax float, ymax float, inputsrid integer,
--   workingsrid integer, ouputsrid integer)

INSERT INTO us_hex_grid (geom)
SELECT hex_grid(1.0, -121.0, 23.0, -64.0, 47.0, 4326, 2163, 4326);

-- Create spatial index

CREATE INDEX us_hex_grid_geom_idx ON us_hex_grid USING gist (geom);

-- Cluster table by spatial index (for spatial query performance)
CLUSTER us_hex_grid USING us_hex_grid_geom_idx;

-- Update stats on table
ANALYZE us_hex_grid;

--Check accuracy of results (in square km)

SELECT
  (SELECT Count(*)
   FROM us_hex_grid) AS hexagon_count,

  (SELECT (MIN(ST_Area(geom::GEOGRAPHY, FALSE)) / 1000000.0)::NUMERIC(10,3)
   FROM us_hex_grid) AS min_area,

  (SELECT (MAX(ST_Area(geom::GEOGRAPHY, FALSE)) / 1000000.0)::NUMERIC(10,3)
   FROM us_hex_grid) AS max_area;