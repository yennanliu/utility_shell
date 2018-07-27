#!/bin/sh

# =========================

echo '*************'
current_date_time_=`date "+%Y-%m-%d %H:%M:%S"`
echo 'current_date_time_ : ' $current_date_time_;
echo '*************'



# =========================


echo '-------------'
echo 'delete table...'
echo '-------------'


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DROP TABLE IF EXISTS rw.user_address_nonnull_lonlat;
EOF

# =========================


echo '-------------'
echo 'create table ...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

   CREATE TABLE rw.user_address_nonnull_lonlat AS
  (SELECT *
   FROM rw.user_address_lonlat
   WHERE lat != 'None'
     AND lon != 'None' ) 

EOF

# =========================


echo '-------------'
echo 'modify schema dtype ...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

  ALTER TABLE rw.user_address_nonnull_lonlat
  ALTER COLUMN lat TYPE double precision USING lat::double precision;

  ALTER TABLE rw.user_address_nonnull_lonlat
  ALTER COLUMN lon TYPE double precision USING lon::double precision;

EOF


# =========================

echo '-------------'
echo 'create non null lon/lat with hz table...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DROP TABLE IF EXISTS rw.user_address_nonnull_lonlat_hz;
EOF


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

CREATE TABLE rw.user_address_nonnull_lonlat_hz AS
( 
WITH user_address_geom AS
  (SELECT member_id, 
          ST_SetSRID(ST_MakePoint(lon, lat), 4326) AS address_pos_gis,
          lon,
          lat
   FROM rw.user_address_nonnull_lonlat)
SELECT addr_nonnull_lonlat.*,
       sz.name AS zone_name
FROM user_address_geom u
LEFT JOIN rw.homezone sz ON st_contains(sz.geom, u.address_pos_gis)
LEFT JOIN rw.user_address_nonnull_lonlat addr_nonnull_lonlat on addr_nonnull_lonlat.member_id = u.member_id
 ) ; 


EOF



# =========================


echo '-------------'
echo 'testing query...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT COUNT(*) FROM rw.user_address_nonnull_lonlat   
UNION ALL 
SELECT COUNT(*) FROM rw.user_address_nonnull_lonlat_hz ;
EOF


# =========================







