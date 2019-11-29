#!/bin/bash
base_sql="select * from"
for i in 1 2 3 4 5
do
	#echo "select * from $i"
	echo "${base_sql}" $i 
done