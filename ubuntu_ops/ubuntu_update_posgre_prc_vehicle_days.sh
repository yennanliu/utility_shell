#!/bin/sh

# specify a password to psql non-interactively?
# https://stackoverflow.com/questions/6405127/how-do-i-specify-a-password-to-psql-non-interactively


<<COMMENT1
-------------
# example 1 
-------------

export PGPASSWORD='password'
psql -h 'server name' -U 'user name' -d 'base name' \
     -c 'command' (eg. 'select * from schema.table')

-------------
# example 2 
-------------

### Please export following env variables first in case connect to posgre server 

export PGPASSWORD=<password>
export host=<hostname>
export port=<portname>
export username=<username>
export dbname=<dbname>


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
select  * from prc.sdb_members_dev limit 4;
EOF

COMMENT1



# =========================

echo '-------------'
echo 'clean view lastest data.... (prc.vehicle_days_dev)'
echo '-------------'


psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
DELETE
FROM prc.vehicle_days_dev
WHERE date(date) >= date((now() - interval '2 day'))
  AND date(date) <= date((now() - interval '1 day')) ;
EOF

# =========================

echo '-------------'
echo 'insert lastest data from view to table .... (prc.vehicle_days -> prc.vehicle_days_dev)'
echo '-------------'



psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
INSERT INTO prc.vehicle_days_dev
  (SELECT *
   FROM prc.vehicle_days
   WHERE date(date) >= date((now() - interval '2 day'))
     AND date(date) <= date((now() - interval '1 day')) );
EOF


# =========================

echo '-------------'
echo 'testing select'
echo '-------------'

psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
SELECT date, count(*)
FROM prc.vehicle_days_dev
GROUP BY date
ORDER BY date ;
EOF










