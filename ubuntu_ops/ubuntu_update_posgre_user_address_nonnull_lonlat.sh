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
echo 'testing query...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT COUNT(*) FROM rw.user_address_nonnull_lonlat   ;
EOF






