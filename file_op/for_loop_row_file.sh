#!/bin/sh


for line in `cat $1` ; 
do 
echo 'line : ' $line 
done 


# $ bash for_loop_row_file.sh  df_test.csv 