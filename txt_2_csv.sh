#!/bin/sh
# http://www.unix.com/shell-programming-and-scripting/141331-converting-txt-file-csv.html


sed 's/[[:space:]]\+/;/g' textname.txt > csvname.csv