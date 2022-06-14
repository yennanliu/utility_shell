----------------------------------
-- 1) create table and insert data
----------------------------------

-- https://www.obstkel.com/redshift-create-table-example

-- DDL for city table (redshift)

CREATE TABLE city (
    id INTEGER primary key,
    name VARCHAR,
    state VARCHAR,
    country VARCHAR
);

INSERT INTO city
values
(1, 'Bob', 'US', 'NY'),
(2, 'Lily', 'TW', 'TPE'),
(3, 'Kim', 'UK', 'LDN'),
(4, 'Ana', 'FR', 'PARIS'),
(5, 'Jack', 'JP', 'TOKYO');


----------------------------------
-- 1) create table and insert random data
----------------------------------


CREATE TABLE date_dimension (
    id INTEGER primary key,
    date VARCHAR,
    month VARCHAR
);

INSERT INTOdate_dimension ..
select ......   
 from 
  (
    SELECT
      '2020-12-31' :: DATE + seq AS datum,
      seq
    FROM (SELECT row_number() over () AS seq FROM stl_scan LIMIT 365 ) 
    ORDER BY seq
  ) 

