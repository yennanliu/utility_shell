#!/bin/sh
# https://stackoverflow.com/questions/19071512/socket-error-errno-48-address-already-in-use


#################################################################
# KILL THE PROCESS WHICH IS CURRENTLY USING THE SPECIFIC PORT  
#################################################################

<<COMMENT1

 
1) get the port using details  (5423 port for example)
lsof -i tcp:5432

2) kill all processed with given port (8000 port for example)
sudo lsof -t -i tcp:8000 | xargs kill -9

3)  get the pid of the process (8000 port for example)
# $sudo lsof -i:8080

4) kill it 
# $kill -9 <pid>

COMMENT1


function kill_process_with_port_V1(){

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
	done; 

}


function kill_process_with_port_V2(){

echo '* Following processes are using port :' $1
echo '* Pid list :'  $pids
for pid in $pids;
	do 
		echo 'kill : ' $pid ; 
		sudo lsof -t -i tcp:$pid | xargs kill -9
	done; 

}

# kill process using port with func V2 
# bash utility_shell/network/clean_port.sh 8888 5432 
kill_process_with_port_V2
