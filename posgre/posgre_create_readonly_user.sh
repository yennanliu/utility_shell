#!/bin/sh


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













