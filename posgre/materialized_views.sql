
-- http://www.postgresqltutorial.com/postgresql-materialized-views/


-- create a new materialized views

CREATE MATERIALIZED VIEW view_name
AS
query
WITH [NO] DATA;


-- Refreshing data for materialized views
-- (add CONCURRENTLY parameter avoiding posgre lock table when refresh
-- REFRESH MATERIALIZED VIEW view_name;
REFRESH MATERIALIZED VIEW CONCURRENTLY view_name;


-- Remove materialized views
DROP MATERIALIZED VIEW view_name;