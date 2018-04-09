
#!/bin/sh

# or u can import csv by sqlite shell
# $ sqlite3 movie_metadata.db
# sqlite> .mode csv movie
# sqlite> .import movie_metadata.csv movie
# -----------------
# https://stackoverflow.com/questions/27371765/importing-csv-file-to-sqlite3-db-table
# (echo .separator ,; echo .import path/to/file.csv table_name) | sqlite3 filename.db
# -----------------
#(echo .separator ,; echo .import your.csv movie) | sqlite3 yourdbname.db




read -p "plz enter csv name : " csv_name 
read -p "plz enter DB name : " DB_name 
read -p "plz enter table name : " table_name 


echo "csv_name = $csv_name"
echo "DB_name = $DB_name"
echo "table_name = $table_name"


(echo .separator ,; echo .import $csv_name $table_name) | sqlite3 $DB_name









