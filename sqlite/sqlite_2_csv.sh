#!/bin/sh




# export sqlite -> csv 
#https://stackoverflow.com/questions/5776660/export-from-sqlite-to-csv-using-shell-script
sqlite3 -header -csv test.db "select * from company;" > sqlite_out.csv