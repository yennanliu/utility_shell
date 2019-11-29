#!/bin/sh
####################################################################
# SCRIPT FOR LOOP BUILD TABLES IN REDSHIFT WITH PARAM 
####################################################################

base_for_loop() {
base_sql="select * from table_"
for i in 1 2 3 4 5
    do
        #echo "select * from $i"
        echo "${base_sql}"$i 
    done 
}

base_for_loop