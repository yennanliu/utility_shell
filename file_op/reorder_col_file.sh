#!/bin/sh

cat $1 | awk -F',' '{print $2 "," $1 "," $3 "," $4 }'

# quick start 
# $ bash reorder_col.sh  df_test.csv 