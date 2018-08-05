#!/bin/sh


cat $1 | awk -F',' '{print $2 "," $1 "," $3 "," $4 }'