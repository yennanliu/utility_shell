#!/bin/sh

csv_name=$1
table_name=$2

if [[ !$csv_name || !$table_name ]]; then
  echo 'csv name or table name is unset'
  exit 1;
fi

echo 'csv name = ' + $csv_name
echo 'table name = ' + table_name

cmd="LOAD DATA LOCAL INFILE '${csv_name}' INTO TABLE '${table_name}' FIELDS TERMINATED BY ',' enclosed by '\"'"

echo 'cmd = ' + $cmd

# mysql -u admin -p --local_infile=1 DATABASE_NAME -e "LOAD DATA LOCAL INFILE 'students.csv' INTO TABLE TABLE_NAME FIELDS TERMINATED BY ',' enclosed by '\"'"
