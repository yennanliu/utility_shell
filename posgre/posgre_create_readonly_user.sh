#!/bin/sh


# ------- create a new read only user  ------- 
## please modify user account and password here 
psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
CREATE ROLE test_user WITH LOGIN PASSWORD 'Test1234'  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION VALID UNTIL 'infinity'; 
GRANT CONNECT ON DATABASE your_db_name TO test_user; 
EOF


# ------- grant new user DB read only access  ------- 

## declare an array variable
declare -a schema_list=("ana" "rw" "rpt" "prc")


for i in "${schema_list[@]}"
do
   echo "$i"
   echo "GRANT USAGE ON SCHEMA $i TO test_user"
psql \
   --host=$host \
   --port=$port \
   --username  $username\
   --dbname=$dbname << EOF
GRANT USAGE ON SCHEMA $i TO test_user  ;
GRANT SELECT ON ALL TABLES IN SCHEMA $i TO test_user;
GRANT SELECT ON ALL SEQUENCES IN SCHEMA $i TO test_user;
EOF
done













