----------------------------------
-- 1) create table and insert data
----------------------------------

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
