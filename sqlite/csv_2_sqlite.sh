#!/bin/sh



# or u can import csv by sqlite shell
# $ sqlite3 movie_metadata.db
# sqlite> .mode csv movie
# sqlite> .import movie_metadata.csv movie




# https://stackoverflow.com/questions/27371765/importing-csv-file-to-sqlite3-db-table
# (echo .separator ,; echo .import path/to/file.csv table_name) | sqlite3 filename.db




(echo .separator ,; echo .import your.csv movie) | sqlite3 yourdbname.db