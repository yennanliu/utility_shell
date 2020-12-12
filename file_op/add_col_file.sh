#!/bin/sh
current_date_time_=`date "+%Y-%m-%d %H:%M:%S"`
echo '$current_date_time_'

awk -F',' '{print $current_date_time_ "," $0}' $1 
