#!/bin/sh




# export sqlite -> csv 
# https://stackoverflow.com/questions/5776660/export-from-sqlite-to-csv-using-shell-script
# sqlite3 -header -csv test.db "select * from company;" > sqlite_out.csv
echo '-------------'
echo 'Run as following commands : '
echo 'sqlite3 -header -csv <db_name>.db "select * from <table_name>;" >  <csv_name>.csv'
echo "db_name :  $1 ,  table_name : $2 ,  csv_name : $3"
echo '-------------'


sqlite3 -header -csv $1.db "select * from $2;" >  $3.csv
