#!/bin/sh
# https://stackoverflow.com/questions/19071512/socket-error-errno-48-address-already-in-use


#################################################################
# KILL THE PROCESS WHICH IS CURRENTLY USING THE SPECIFIC PORT  
#################################################################

<<COMMENT1

# demo 
get the pid of the process 
# $sudo lsof -i:8080
# kill it 
# $kill -9 <pid>

COMMENT1


# STEP 1) get the process pid 
echo '* Following processes are using port :' $1 
lsof -i:$1
pids="` lsof -i:$1 | awk 'FNR > 2 {print $2}'`"
echo '* Pid list :'  $pids

# STEP 2) kill all of them
for pid in $pids; 
	do 
		echo 'kill : ' $pid ;
		kill -9 $pid
	done 














