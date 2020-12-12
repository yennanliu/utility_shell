#!/bin/sh
# https://www.shellhacks.com/bash-read-file-line-by-line-while-read-line-loop/

#################################################################
# DEMO SCRIPT READ FILE LINE BY LINE 
#################################################################

FILE=$1
while read LINE; do
     echo "$LINE"
done < $FILE