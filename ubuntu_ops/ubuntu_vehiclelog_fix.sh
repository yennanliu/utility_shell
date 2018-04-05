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
DROP TABLE IF EXISTS rw.vehicle_logs_fixed;
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

CREATE TABLE rw.vehicle_logs_fixed AS
        (SELECT *
      FROM rw.vehicle_logs
      ORDER BY date, TIME) ; 

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
SELECT COUNT(*) FROM  rw.vehicle_logs_fixed ;
EOF




# =========================

echo '-------------'
echo 'fix event back ...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF

  WITH triple AS (
          SELECT vin, category
          , LAG(category,1) OVER www AS must_be_c
          , LAG(date,1) OVER www AS c_date
          , LAG(time,1) OVER www AS c_time
          FROM rw.vehicle_logs_fixed 
                  WINDOW www AS (PARTITION BY vin ORDER BY date,time desc)
          )
  INSERT INTO rw.vehicle_logs_fixed ( date,time , category , vin )
  SELECT t.c_date, t.c_time,'Return to Service', t.vin
  FROM triple t
  WHERE t.must_be_c = 'Out of Service' ; 

EOF



# =========================

echo '-------------'
echo 'testing query ...'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT COUNT(*) FROM  rw.vehicle_logs_fixed ;
EOF





