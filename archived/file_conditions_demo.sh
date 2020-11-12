#!/bin/sh

# https://devhints.io/bash

: '

### FILE CONDITIONS 

[ -e FILE ]	Exists
[ -r FILE ]	Readable
[ -h FILE ]	Symlink
[ -d FILE ]	Directory
[ -w FILE ]	Writable
[ -s FILE ]	Size is > 0 bytes
[ -f FILE ]	File
[ -x FILE ]	Executable
[ FILE1 -nt FILE2 ]	1 is more recent than 2
[ FILE1 -ot FILE2 ]	2 is more recent than 1
[ FILE1 -ef FILE2 ]	Same files
'

# -----------------------------------
echo 'DEMO 1)'

if [ -e "file_conditions_demo.sh" ] ; then 
	echo "file_conditions_demo.sh exist " 
else echo "file_conditions_demo.sh not exist" 
fi 

# -----------------------------------
echo 'DEMO 2)'

for i in `ls` ; 
do
	if [ -d $i ] ; then  
		echo   "Is a directory  "  $i
	else echo "Not a directory "  $i
	fi 
done 

# -----------------------------------
echo 'DEMO 3)'

for i in `ls` ; 
do
	if [ -x $i ] ; then  
		echo   "Is  Executable  "  $i
	else echo "Not  Executable "  $i
	fi 
done 

# -----------------------------------
echo 'DEMO 4)'

for i in `ls` ; 
do
	if [ -s $i ] ; then  
		echo   "Size is > 0 bytes  "  $i
	else echo "Size is = 0 bytes "  $i
	fi 
done 
